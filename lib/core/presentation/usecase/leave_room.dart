import 'package:compassly/core/domain/repositories/room_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/usecase/usecase.dart';
import 'package:ribs_core/ribs_core.dart';

class LeaveRoomUsecase extends Usecase<LeaveRoomUsecaseParams, void> {
  final RoomRepository _roomRepository;

  const LeaveRoomUsecase({required this._roomRepository});

  @override
  Future<Either<Failure, void>> call(LeaveRoomUsecaseParams params) async {
    final foLeave = await _roomRepository.leave(
      uid: params.uid,
      code: params.code,
    );

    if (foLeave case Left(:final a)) return Left(a);

    if (params.memberCount < 2) {
      _roomRepository.destroy(code: params.code);
    }

    return Right(null);
  }
}

class LeaveRoomUsecaseParams {
  final String uid;
  final String code;
  final int memberCount;

  LeaveRoomUsecaseParams({
    required this.uid,
    required this.code,
    required this.memberCount,
  });
}
