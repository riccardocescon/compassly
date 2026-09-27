import 'package:compassly/core/failures/failure.dart';
import 'package:ribs_core/ribs_core.dart';

abstract class SessionRepository {
  const SessionRepository();

  Future<Either<Failure, void>> create({required String code});
  Future<Either<Failure, void>> delete({required String code});
}
