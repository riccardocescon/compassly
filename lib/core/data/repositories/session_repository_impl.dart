import 'package:compassly/core/data/api/session_api.dart';
import 'package:compassly/core/data/models/ice_candidate_document_model.dart';
import 'package:compassly/core/data/models/session_description_model.dart';
import 'package:compassly/core/domain/entities/ice_candidate_document.dart';
import 'package:compassly/core/domain/entities/session_description.dart';
import 'package:compassly/core/domain/entities/session_document.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:ribs_core/ribs_core.dart';

class SessionRepositoryImpl extends SessionRepository {
  final SessionApi _sessionApi;

  const SessionRepositoryImpl({required this._sessionApi});

  @override
  Future<Either<Failure, void>> create({required String code}) async {
    return _sessionApi.create(sessionId: code);
  }

  @override
  Future<Either<Failure, void>> delete({required String code}) async {
    return _sessionApi.delete(sessionId: code);
  }

  @override
  Future<Either<Failure, void>> writeOffer({
    required String code,
    required SessionDescription offer,
  }) async {
    return _sessionApi.writeOffer(
      sessionId: code,
      offer: SessionDescriptionModel.fromEntity(offer),
    );
  }

  @override
  Future<Either<Failure, void>> writeAnswer({
    required String code,
    required SessionDescription answer,
  }) async {
    return _sessionApi.writeAnswer(
      sessionId: code,
      answer: SessionDescriptionModel.fromEntity(answer),
    );
  }

  @override
  Stream<Either<Failure, SessionDocument>> watchSession({
    required String code,
  }) {
    return _sessionApi
        .watchSession(sessionId: code)
        .map((result) => result.map((model) => model.toEntity()));
  }

  @override
  Future<Either<Failure, void>> addOfferCandidate({
    required String code,
    required ICECandidateDocument candidate,
  }) async {
    return _sessionApi.addOfferCandidate(
      sessionId: code,
      candidate: ICECandidateDocumentModel.fromEntity(candidate),
    );
  }

  @override
  Stream<Either<Failure, List<ICECandidateDocument>>> watchOfferCandidates({
    required String code,
  }) {
    return _sessionApi
        .watchOfferCandidates(sessionId: code)
        .map(
          (result) =>
              result.map((models) => models.map((m) => m.toEntity()).toList()),
        );
  }

  @override
  Future<Either<Failure, void>> addAnswerCandidate({
    required String code,
    required ICECandidateDocument candidate,
  }) async {
    return _sessionApi.addAnswerCandidate(
      sessionId: code,
      candidate: ICECandidateDocumentModel.fromEntity(candidate),
    );
  }

  @override
  Stream<Either<Failure, List<ICECandidateDocument>>> watchAnswerCandidates({
    required String code,
  }) {
    return _sessionApi
        .watchAnswerCandidates(sessionId: code)
        .map(
          (result) =>
              result.map((models) => models.map((m) => m.toEntity()).toList()),
        );
  }

  @override
  Future<void> clearAllCandidates({required String sessionId}) async {
    return await _sessionApi.clearAllCandidates(sessionId: sessionId);
  }
}
