import 'package:compassly/core/domain/entities/member.dart';
import 'package:compassly/core/domain/entities/room.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:ribs_core/ribs_core.dart';

abstract class RoomRepository {
  const RoomRepository();

  Future<Either<Failure, Room>> create({
    required String uid,
    required Member member,
  });
  Stream<Either<FirestoreFailure, List<Member>>> watchMembers({
    required String code,
  });
  Future<Either<Failure, List<Member>>> fetchMembers({required String code});
  Future<Either<Failure, Room>> join({
    required String code,
    required String uid,
    required Member member,
  });
  Future<Either<Failure, void>> leave({
    required String uid,
    required String code,
  });
  Future<Either<Failure, void>> delete({required String code});
}
