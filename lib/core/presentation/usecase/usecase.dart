import 'package:compassly/core/failures/failure.dart';
import 'package:ribs_core/ribs_core.dart';

abstract class Usecase<P, T> {
  const Usecase();

  Future<Either<Failure, T>> call(P params);
}

abstract class StreamUsecase<P, T> {
  const StreamUsecase();

  Stream<Either<Failure, T>> call(P params);
}
