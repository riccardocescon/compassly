import 'package:compassly/core/domain/entities/member_change.dart';
import 'package:compassly/core/domain/repositories/room_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/usecase/usecase.dart';
import 'package:ribs_core/ribs_core.dart';

class WatchMembersUsecase
    extends StreamUsecase<WatchMembersParams, List<MemberChange>> {
  final RoomRepository _roomRepository;

  const WatchMembersUsecase({required this._roomRepository});

  @override
  Stream<Either<Failure, List<MemberChange>>> call(
    WatchMembersParams params,
  ) async* {
    final watchSteam = _roomRepository.watchMembers(code: params.code).skip(1);

    await for (final foMembers in watchSteam) {
      yield foMembers.fold(
        (l) => Left(l),
        (members) => Right(members.toList()),
      );
    }
  }
}

class WatchMembersParams {
  final String code;
  final String uid;

  WatchMembersParams({required this.uid, required this.code});
}
