import 'package:compassly/core/domain/entities/member.dart';
import 'package:compassly/core/domain/entities/room.dart';
import 'package:compassly/core/domain/repositories/room_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/usecase/usecase.dart';
import 'package:ribs_core/ribs_core.dart';

class CreateRoomUsecase extends Usecase<CreateRoomUsecaseParams, Room> {
  final RoomRepository _roomRepository;

  const CreateRoomUsecase({required this._roomRepository});

  @override
  Future<Either<Failure, Room>> call(CreateRoomUsecaseParams params) async {
    return _roomRepository.create(
      uid: params.member.uid,
      member: params.member,
    );
  }
}

class CreateRoomUsecaseParams {
  final Member member;

  CreateRoomUsecaseParams({required this.member});
}
