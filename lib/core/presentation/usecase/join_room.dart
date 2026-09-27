import 'dart:developer';

import 'package:compassly/core/domain/entities/member.dart';
import 'package:compassly/core/domain/entities/room.dart';
import 'package:compassly/core/domain/repositories/room_repository.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/usecase/usecase.dart';
import 'package:compassly/core/utils/generators.dart';
import 'package:ribs_core/ribs_core.dart';

class JoinRoomUsecase extends Usecase<JoinRoomUsecaseParams, Room> {
  final RoomRepository _roomRepository;
  final SessionRepository _sessionRepository;

  const JoinRoomUsecase({
    required this._roomRepository,
    required this._sessionRepository,
  });

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

    for (final member in members) {
      if (member.uid == params.uid) continue;

      final sessionCode = Generators.generateSessionId(
        roomCode: params.code,
        uidA: params.uid,
        uidB: member.uid,
      );

      _sessionRepository.create(code: sessionCode).then((res) {
        res.fold((l) {
          log(l.message);
        }, (r) {});
      });
    }

    final room = Room(code: params.code, members: members);

    return Right(room);
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
