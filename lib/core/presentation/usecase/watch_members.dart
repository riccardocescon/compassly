import 'package:compassly/core/domain/entities/ice_candidate_document.dart';
import 'package:compassly/core/domain/entities/session_description.dart';
import 'package:compassly/core/domain/repositories/room_repository.dart';
import 'package:compassly/core/domain/repositories/session_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/usecase/usecase.dart';
import 'package:compassly/core/utils/generators.dart';
import 'package:ribs_core/ribs_core.dart';

class WatchMembersUsecase extends StreamUsecase<WatchMembersParams, void> {
  final RoomRepository _roomRepository;
  final SessionRepository _sessionRepository;

  const WatchMembersUsecase({
    required this._roomRepository,
    required this._sessionRepository,
  });

  @override
  Stream<Either<Failure, void>> call(WatchMembersParams params) async* {
    final watchSteam = _roomRepository.watchMembers(code: params.code).skip(1);

    await for (final foMembers in watchSteam) {
      if (foMembers case Left(a: final failure)) {
        yield Left(failure);
        return;
      }

      final members = foMembers.getOrElse(() => []);

      for (final member in members) {
        if (member.uid == params.uid) continue;

        final sessionCode = Generators.generateSessionId(
          roomCode: params.code,
          uidA: params.uid,
          uidB: member.uid,
        );

        final foSession = await _sessionRepository.create(code: sessionCode);
        if (foSession case Left(:final a)) {
          yield Left(a);
          return;
        }

        final foOffer = await _sessionRepository.writeAnswer(
          code: sessionCode,
          answer: SessionDescription(sdp: 'sdp', type: 'answer'),
        );
        if (foOffer case Left(:final a)) {
          yield Left(a);
          return;
        }

        final foCandidate = await _sessionRepository.addAnswerCandidate(
          code: sessionCode,
          candidate: ICECandidateDocument(
            id: '',
            candidate: 'candidate',
            sdpMid: 'sdpMid',
            sdpMLineIndex: 0,
          ),
        );
        if (foCandidate case Left(:final a)) {
          yield Left(a);
          return;
        }
      }
    }
  }
}

class WatchMembersParams {
  final String code;
  final String uid;

  WatchMembersParams({required this.uid, required this.code});
}
