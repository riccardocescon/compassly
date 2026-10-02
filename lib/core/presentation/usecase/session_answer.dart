import 'dart:developer';

import 'package:compassly/core/domain/entities/session_description.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/usecase/usecase.dart';
import 'package:compassly/core/utils/generators.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:ribs_core/ribs_core.dart';

class SessionAnswer extends Usecase<SessionAnswerParams, void> {
  final SessionRepository _sessionRepository;

  const SessionAnswer({required this._sessionRepository});

  @override
  Future<Either<Failure, void>> call(SessionAnswerParams params) async {
    final sessionCode = Generators.generateSessionId(
      roomCode: params.code,
      uidA: params.uid,
      uidB: params.memberUid,
    );

    try {
      print('[DBG-RTC] ANSWERER start session=$sessionCode');
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

      print('[DBG-RTC] ANSWERER offer received, failure=$failure');
      if (failure != null) return Left(failure!);
      if (sessionDescriptor == null) {
        return Left(SessionFailure.timeout('SessionDescriptor not created'));
      }

      await params.peerConnection.setRemoteDescription(
        RTCSessionDescription(sessionDescriptor!.sdp, sessionDescriptor!.type),
      );

      print('[DBG-RTC] ANSWERER remote description set');
      final sessionDescription = await params.peerConnection.createAnswer();

      final (sdp, type) = (sessionDescription.sdp, sessionDescription.type);
      if (sdp == null || type == null) {
        return Left(DataFailure.preprocess('sdp or type is null'));
      }

      print('[DBG-RTC] ANSWERER answer created');
      await params.peerConnection.setLocalDescription(sessionDescription);

      final foAnswer = await _sessionRepository.writeAnswer(
        code: sessionCode,
        answer: SessionDescription(sdp: sdp, type: type),
      );
      print('[DBG-RTC] ANSWERER answer written, isLeft=${foAnswer.isLeft}');
      if (foAnswer case Left(:final a)) {
        return Left(a);
      }

      return const Right(null);
    } catch (e, st) {
      print('[DBG-RTC] ANSWERER CATCH $e\n$st');
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
