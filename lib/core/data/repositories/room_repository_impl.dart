import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compassly/core/data/api/room_api.dart';
import 'package:compassly/core/data/models/member_model.dart';
import 'package:compassly/core/domain/entities/member.dart';
import 'package:compassly/core/domain/entities/member_change.dart';
import 'package:compassly/core/domain/entities/room.dart';
import 'package:compassly/core/domain/repositories/room_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/utils/generators.dart';
import 'package:ribs_core/ribs_core.dart';

class RoomRepositoryImpl extends RoomRepository {
  final RoomApi _roomApi;

  const RoomRepositoryImpl({required this._roomApi});

  @override
  Future<Either<Failure, Room>> create({
    required String uid,
    required Member member,
  }) async {
    final code = Generators.generateCode();
    final name = Generators.generateName();
    final result = await _roomApi.create(code: code, roomName: name);

    if (result case Left(:final a)) return Left(a);

    final memberModel = MemberModel.fromEntity(member, uid: uid);
    final result2 = await _roomApi.join(code: code, member: memberModel);

    if (result2 case Left(:final a)) return Left(a);

    return Right(Room(code: code, members: [member]));
  }

  @override
  Stream<Either<FirestoreFailure, List<MemberChange>>> watchMembers({
    required String code,
  }) async* {
    final stream = _roomApi.watchMembers(code: code);

    await for (final message in stream) {
      yield message.fold(
        (l) => Left(l),
        (r) => Right(
          r
              .map((m) {
                switch (m.$1) {
                  case DocumentChangeType.added:
                    return MemberChange.joined(member: m.$2.toEntity());
                  case DocumentChangeType.removed:
                    return MemberChange.left(member: m.$2.toEntity());
                  default:
                    return null;
                }
              })
              .whereType<MemberChange>()
              .toList(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Member>>> fetchMembers({
    required String code,
  }) async {
    final result = await _roomApi.fetchMembers(code: code);

    if (result case Left(:final a)) return Left(a);

    return result.map(
      (models) => models.map((model) => model.toEntity()).toList(),
    );
  }

  @override
  Future<Either<Failure, Room>> join({
    required String code,
    required String uid,
    required Member member,
  }) async {
    final foRoom = await _roomApi.search(code: code);
    if (foRoom case Left(:final a)) return Left(a);

    final memberModel = MemberModel.fromEntity(member, uid: uid);
    final result2 = await _roomApi.join(code: code, member: memberModel);

    if (result2 case Left(:final a)) return Left(a);

    return Right(Room(code: code, members: [member]));
  }

  @override
  Future<Either<Failure, void>> leave({
    required String code,
    required String uid,
  }) async {
    final result = await _roomApi.leave(code: code, uid: uid);

    return result;
  }

  @override
  Future<Either<Failure, void>> delete({required String code}) async {
    final result = await _roomApi.delete(code: code);

    return result;
  }
}
