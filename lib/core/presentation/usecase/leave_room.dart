import 'dart:developer';

import 'package:compassly/core/domain/repositories/room_repository.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/usecase/usecase.dart';
import 'package:compassly/core/utils/generators.dart';
import 'package:ribs_core/ribs_core.dart';

class LeaveRoomUsecase extends Usecase<LeaveRoomUsecaseParams, void> {
  final RoomRepository _roomRepository;
  final SessionRepository _sessionRepository;

  const LeaveRoomUsecase({
    required this._roomRepository,
    required this._sessionRepository,
  });

  @override
  Future<Either<Failure, void>> call(LeaveRoomUsecaseParams params) async {
    final foMembers = await _roomRepository.fetchMembers(code: params.code);
    if (foMembers case Left(:final a)) return Left(a);
    final members = foMembers.getOrElse(() => []);

    if (members.length < 2) {
      await _roomRepository.delete(code: params.code);
    }

    final foLeave = await _roomRepository.leave(
      uid: params.uid,
      code: params.code,
    );

    if (foLeave case Left(:final a)) return Left(a);

    for (final member in members) {
      if (member.uid == params.uid) continue;

      final sessionCode = Generators.generateSessionId(
        roomCode: params.code,
        uidA: params.uid,
        uidB: member.uid,
      );

      _sessionRepository.clearAllCandidates(sessionId: sessionCode);

      _sessionRepository.delete(code: sessionCode).then((res) {
        res.fold((l) {
          log(l.message);
        }, (r) {});
      });
    }

    return Right(null);
  }
}

class LeaveRoomUsecaseParams {
  final String uid;
  final String code;

  LeaveRoomUsecaseParams({required this.uid, required this.code});
}
