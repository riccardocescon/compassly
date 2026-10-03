import 'dart:async';
import 'dart:developer';

import 'package:compassly/core/domain/entities/ice_candidate_document.dart';
import 'package:compassly/core/domain/entities/peer_connection_data.dart';
import 'package:compassly/core/domain/entities/session_description.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/presentation/usecase/usecase.dart';
import 'package:compassly/core/utils/generators.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:ribs_core/ribs_core.dart';

class OfferSessionUsecase extends Usecase<CreatePeerConnectionParams, void> {
  final SessionRepository _sessionRepository;

  const OfferSessionUsecase({required this._sessionRepository});

  @override
  Future<Either<Failure, void>> call(CreatePeerConnectionParams params) async {
    final connectionData = params.peerConnectionData;
    final sessionCode = Generators.generateSessionId(
      roomCode: params.roomCode,
      uidA: params.uid,
      uidB: connectionData.remoteMemberUid,
    );
    StreamSubscription? answerSub;

    try {
      final sessionDescriptor = await connectionData.connection.createOffer();
      final (sdp, type) = (sessionDescriptor.sdp, sessionDescriptor.type);
      if (sdp == null || type == null) {
        return Left(DataFailure.preprocess('Sdp or Type is null'));
      }

      connectionData.connection.onIceCandidate = (iceCandidate) {
        final candidate = ICECandidateDocument.fromRTCIceCandidate(
          iceCandidate,
        );
        if (candidate == null) return;

        _sessionRepository.addOfferCandidate(
          code: sessionCode,
          candidate: candidate,
        );
      };

      final foSessionCreate = await _sessionRepository.create(
        code: sessionCode,
      );
      if (foSessionCreate case Left(:final a)) {
        return Left(a);
      }

      await connectionData.connection.setLocalDescription(sessionDescriptor);

      final foOffer = await _sessionRepository.writeOffer(
        code: sessionCode,
        offer: SessionDescription(sdp: sdp, type: type),
      );
      if (foOffer case Left(:final a)) {
        return Left(a);
      }

      SessionDescription? sessionDescription;
      Failure? sessionFailure;
      await _sessionRepository
          .watchSession(code: sessionCode)
          .timeout(const Duration(seconds: 30))
          .firstWhere(
            (e) => e.fold(
              (l) {
                sessionFailure = l;
                return false;
              },
              (sessionDoc) {
                if (sessionDoc.answer != null) {
                  sessionDescription = sessionDoc.answer;
                  return true;
                }

                return false;
              },
            ),
          );

      if (sessionDescription?.sdp == null) {
        return Left(
          sessionFailure ??
              SessionFailure.closed('Closed without error, unkown cause'),
        );
      }

      await connectionData.connection.setRemoteDescription(
        RTCSessionDescription(
          sessionDescription!.sdp,
          sessionDescription!.type,
        ),
      );

      final completer = Completer();

      connectionData.connection.onIceConnectionState = (state) {
        if (completer.isCompleted) return;

        switch (state) {
          case RTCIceConnectionState.RTCIceConnectionStateConnected:
            completer.complete();
          case RTCIceConnectionState.RTCIceConnectionStateFailed:
            completer.completeError(SessionFailure.closed('Failed to connect'));
          case RTCIceConnectionState.RTCIceConnectionStateClosed:
            completer.completeError(SessionFailure.closed('Closed'));
          case _:
        }
      };

      final answerStream = _sessionRepository.watchAnswerCandidates(
        code: sessionCode,
      );
      answerSub = answerStream.listen((state) async {
        switch (state) {
          case Left(:final a):
            log('Error: ${a.message}');
          case Right(b: final candidates):
            for (final candidate in candidates) {
              try {
                await connectionData.connection.addCandidate(
                  candidate.toIceCandidate(),
                );
              } catch (e) {
                log('Error: ${e.toString()}');
              }
            }
        }
      });

      await completer.future.timeout(const Duration(seconds: 30));
      return Right(null);
    } catch (e) {
      return Left(SessionFailure.catched(e.toString()));
    } finally {
      // If connection is established, stop saving iceCandidates
      connectionData.connection.onIceCandidate = (_) {};
      connectionData.connection.onIceConnectionState = (_) {};
      await answerSub?.cancel();
      await _sessionRepository.clearAllCandidates(sessionId: sessionCode);
      await _sessionRepository.delete(code: sessionCode);
    }
  }
}

class CreatePeerConnectionParams {
  final PeerConnectionData peerConnectionData;
  final String roomCode;
  final String uid;

  CreatePeerConnectionParams({
    required this.peerConnectionData,
    required this.roomCode,
    required this.uid,
  });
}
