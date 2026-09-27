import 'package:compassly/core/data/api/session_api.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:ribs_core/ribs_core.dart';

class SessionRepositoryImpl extends SessionRepository {
  final SessionApi _sessionApi;

  const SessionRepositoryImpl({required this._sessionApi});

  @override
  Future<Either<Failure, void>> create({required String code}) async {
    final result = await _sessionApi.create(sessionId: code);

    return result;
  }

  @override
  Future<Either<Failure, void>> delete({required String code}) async {
    final result = await _sessionApi.delete(sessionId: code);

    return result;
  }
}
