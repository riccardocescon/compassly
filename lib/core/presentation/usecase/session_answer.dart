import 'dart:async';
import 'dart:developer';

import 'package:compassly/core/domain/entities/ice_candidate_document.dart';
import 'package:compassly/core/domain/entities/session_description.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/usecase/usecase.dart';
import 'package:compassly/core/utils/generators.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:ribs_core/ribs_core.dart';

class SessionAnswerUsecase extends Usecase<SessionAnswerParams, void> {
  final SessionRepository _sessionRepository;

  const SessionAnswerUsecase({required this._sessionRepository});

  @override
  Future<Either<Failure, void>> call(SessionAnswerParams params) async {
    final peerConnection = params.peerConnection;
    final sessionCode = Generators.generateSessionId(
      roomCode: params.code,
      uidA: params.uid,
      uidB: params.memberUid,
    );
    StreamSubscription? offerSub;

    try {
      SessionDescription? sessionDescriptor;
      Failure? failure;
      await _sessionRepository
          .watchSession(code: sessionCode)
          .timeout(const Duration(seconds: 30))
          .firstWhere(
            (e) => e.fold(
              (l) {
                log('Error: ${l.message}');
                failure = l;
                return false;
              },
              (doc) {
                if (doc.offer == null) return false;

                sessionDescriptor = doc.offer;
                return true;
              },
            ),
          );

      if (failure != null) return Left(failure!);
      if (sessionDescriptor == null) {
        return Left(SessionFailure.timeout('SessionDescriptor not created'));
      }

      await peerConnection.setRemoteDescription(
        RTCSessionDescription(sessionDescriptor!.sdp, sessionDescriptor!.type),
      );

      final completer = Completer();

      peerConnection.onIceConnectionState = (state) {
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

      final offerCandidatesStream = _sessionRepository.watchOfferCandidates(
        code: sessionCode,
      );
      offerSub = offerCandidatesStream.listen((state) async {
        switch (state) {
          case Left(:final a):
            log('Error: ${a.message}');
          case Right(b: final candidates):
            for (final candidate in candidates) {
              try {
                await peerConnection.addCandidate(candidate.toIceCandidate());
              } catch (e) {
                log('Error: ${e.toString()}');
              }
            }
        }
      });

      final sessionDescription = await peerConnection.createAnswer();

      final (sdp, type) = (sessionDescription.sdp, sessionDescription.type);
      if (sdp == null || type == null) {
        return Left(DataFailure.preprocess('sdp or type is null'));
      }

      peerConnection.onIceCandidate = (iceCandidate) {
        final candidate = ICECandidateDocument.fromRTCIceCandidate(
          iceCandidate,
        );

        if (candidate == null) return;

        _sessionRepository.addAnswerCandidate(
          code: sessionCode,
          candidate: candidate,
        );
      };

      await peerConnection.setLocalDescription(sessionDescription);

      final foAnswer = await _sessionRepository.writeAnswer(
        code: sessionCode,
        answer: SessionDescription(sdp: sdp, type: type),
      );
      if (foAnswer case Left(:final a)) {
        return Left(a);
      }

      await completer.future.timeout(const Duration(seconds: 30));
      return const Right(null);
    } catch (e) {
      await offerSub?.cancel();
      peerConnection.onIceCandidate = (_) {};
      peerConnection.onIceConnectionState = (_) {};
      await _sessionRepository.clearAllCandidates(sessionId: sessionCode);
      await _sessionRepository.delete(code: sessionCode);
      return Left(SessionFailure.catched(e.toString()));
    }
  }
}

class SessionAnswerParams {
  final String code;
  final String memberUid;
  final String uid;
  final RTCPeerConnection peerConnection;

  SessionAnswerParams({
    required this.code,
    required this.memberUid,
    required this.uid,
    required this.peerConnection,
  });
}
