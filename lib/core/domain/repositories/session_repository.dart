import 'package:compassly/core/domain/entities/ice_candidate_document.dart';
import 'package:compassly/core/domain/entities/session_description.dart';
import 'package:compassly/core/domain/entities/session_document.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:ribs_core/ribs_core.dart';

abstract class SessionRepository {
  const SessionRepository();

  Future<Either<Failure, void>> create({required String code});
  Future<Either<Failure, void>> delete({required String code});

  Future<Either<Failure, void>> writeOffer({
    required String code,
    required SessionDescription offer,
  });
  Future<Either<Failure, void>> writeAnswer({
    required String code,
    required SessionDescription answer,
  });
  Stream<Either<Failure, SessionDocument>> watchSession({required String code});

  Future<Either<Failure, void>> addOfferCandidate({
    required String code,
    required ICECandidateDocument candidate,
  });
  Stream<Either<Failure, List<ICECandidateDocument>>> watchOfferCandidates({
    required String code,
  });

  Future<Either<Failure, void>> addAnswerCandidate({
    required String code,
    required ICECandidateDocument candidate,
  });
  Stream<Either<Failure, List<ICECandidateDocument>>> watchAnswerCandidates({
    required String code,
  });

  Future<void> clearAllCandidates({required String sessionId});
}
