import 'package:compassly/core/domain/entities/member.dart';
import 'package:compassly/core/domain/entities/room.dart';
import 'package:compassly/core/domain/repositories/room_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/usecase/usecase.dart';
import 'package:ribs_core/ribs_core.dart';

class JoinRoomUsecase extends Usecase<JoinRoomUsecaseParams, Room> {
  final RoomRepository _roomRepository;

  const JoinRoomUsecase({required this._roomRepository});

  @override
  Future<Either<Failure, Room>> call(JoinRoomUsecaseParams params) async {
    final foJoin = await _roomRepository.join(
      code: params.code,
      uid: params.uid,
      member: params.member,
    );

    if (foJoin case Left(:final a)) return Left(a);

    final foMembers = await _roomRepository.fetchMembers(code: params.code);

    if (foMembers case Left(:final a)) return Left(a);

    final members = foMembers.getOrElse(() => []);

    return Right(Room(code: params.code, members: members));
  }
}

class JoinRoomUsecaseParams {
  final String uid;
  final String code;
  final Member member;

  JoinRoomUsecaseParams({
    required this.uid,
    required this.member,
    required this.code,
  });
}
