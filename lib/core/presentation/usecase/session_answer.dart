import 'package:compassly/core/domain/entities/ice_candidate_document.dart';
import 'package:compassly/core/domain/entities/session_description.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/usecase/usecase.dart';
import 'package:compassly/core/utils/generators.dart';
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

    final foSession = await _sessionRepository.create(code: sessionCode);
    if (foSession case Left(:final a)) {
      return Left(a);
    }

    final foOffer = await _sessionRepository.writeAnswer(
      code: sessionCode,
      answer: SessionDescription(sdp: 'sdp', type: 'answer'),
    );
    if (foOffer case Left(:final a)) {
      return Left(a);
    }

    final foCandidate = await _sessionRepository.addAnswerCandidate(
      code: sessionCode,
      candidate: ICECandidateDocument(
        id: '',
        candidate: 'candidate',
        sdpMid: 'sdpMid',
        sdpMLineIndex: 0,
      ),
    );
    if (foCandidate case Left(:final a)) {
      return Left(a);
    }
    return const Right(null);
  }
}

class SessionAnswerParams {
  final String code;
  final String memberUid;
  final String uid;

  SessionAnswerParams({
    required this.code,
    required this.memberUid,
    required this.uid,
  });
}
