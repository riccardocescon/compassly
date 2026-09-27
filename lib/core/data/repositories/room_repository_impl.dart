import 'package:compassly/core/data/api/room_api.dart';
import 'package:compassly/core/data/models/member_model.dart';
import 'package:compassly/core/domain/entities/member.dart';
import 'package:compassly/core/domain/entities/room.dart';
import 'package:compassly/core/domain/repositories/room_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:ribs_core/ribs_core.dart';
import 'package:uuid/uuid.dart';

class RoomRepositoryImpl extends RoomRepository {
  final RoomApi _roomApi;

  String _generateCode() {
    const uuid = Uuid();
    return uuid.v4().substring(0, 6).toUpperCase();
  }

  const RoomRepositoryImpl({required this._roomApi});

  @override
  Future<Either<Failure, Room>> create({
    required String uid,
    required Member member,
  }) async {
    final code = _generateCode();
    final name = _generateCode().toUpperCase();
    final result = await _roomApi.create(code: code, roomName: 'Room $name');

    if (result case Left(:final a)) return Left(a);

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
  Future<Either<Failure, void>> destroy({required String code}) async {
    final result = await _roomApi.destroy(code: code);

    return result;
  }
}
