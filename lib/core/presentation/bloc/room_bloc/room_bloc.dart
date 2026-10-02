import 'dart:async';

import 'package:compassly/core/domain/entities/member.dart';
import 'package:compassly/core/domain/entities/member_change.dart';
import 'package:compassly/core/domain/entities/room.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:compassly/core/presentation/usecase/create_room.dart';
import 'package:compassly/core/presentation/usecase/join_room.dart';
import 'package:compassly/core/presentation/usecase/leave_room.dart';
import 'package:compassly/core/presentation/usecase/watch_members.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ribs_core/ribs_core.dart';

part 'room_event.dart';
part 'room_state.dart';
part 'room_bloc.freezed.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final CreateRoomUsecase _createRoom;
  final JoinRoomUsecase _joinRoom;
  final WatchMembersUsecase _watchMembers;
  final LeaveRoomUsecase _leaveRoom;

  final AuthBloc _authBloc;

  Room? _room;
  StreamSubscription<Either<Failure, List<MemberChange>>>? _watchMembersSub;

  Member get _member => Member(
    name: _authBloc.user!.displayName ?? 'Anonymous',
    uid: _authBloc.user!.uid,
  );

  RoomBloc({
    required this._authBloc,
    required this._createRoom,
    required this._joinRoom,
    required this._watchMembers,
    required this._leaveRoom,
  }) : super(const RoomState.init()) {
    on<_Create>((event, emit) async {
      final user = _authBloc.user;

      if (user == null) {
        emit(
          RoomState.error(failure: DataFailure.preprocess('User not found')),
        );
        return;
      }

      final room = await _createRoom.call(
        CreateRoomUsecaseParams(member: _member),
      );

      room.fold((l) => emit(RoomState.error(failure: l)), (r) {
        _room = r;
        emit(RoomState.data(room: r, members: null));
        _startWatchingMembers(uid: user.uid, code: r.code);
      });
    });
    on<_Join>((event, emit) async {
      final user = _authBloc.user;

      if (user == null) {
        emit(
          RoomState.error(failure: DataFailure.preprocess('User not found')),
        );
        return;
      }

      final room = await _joinRoom.call(
        JoinRoomUsecaseParams(uid: user.uid, code: event.code, member: _member),
      );

      room.fold((l) => emit(RoomState.error(failure: l)), (r) {
        _room = r;
        emit(
          RoomState.data(
            room: _room,
            members: _room?.members
                .where((e) => e.uid != user.uid)
                .map((e) => MemberChange.existing(member: e))
                .toList(),
          ),
        );
        _startWatchingMembers(uid: user.uid, code: event.code);
      });
    });
    on<_Leave>((event, emit) async {
      final user = _authBloc.user;

      if (user == null || _room == null) {
        emit(
          RoomState.error(
            failure: DataFailure.preprocess('User or room not found'),
          ),
        );
        return;
      }

      final foLeave = await _leaveRoom.call(
        LeaveRoomUsecaseParams(uid: user.uid, code: _room!.code),
      );

      foLeave.fold((l) => emit(RoomState.error(failure: l)), (r) {
        _watchMembersSub?.cancel();
        _watchMembersSub = null;
        _room = null;
        emit(RoomState.data(room: null, members: null));
      });
    });
    on<_MembersUpdated>((event, emit) {
      emit(RoomState.data(room: _room, members: event.members));
    });
    on<_MembersWatchFailed>((event, emit) {
      emit(RoomState.error(failure: event.failure));
    });
  }

  void _startWatchingMembers({required String uid, required String code}) {
    _watchMembersSub?.cancel();
    _watchMembersSub = _watchMembers
        .call(WatchMembersParams(uid: uid, code: code))
        .listen((result) {
          result.fold(
            (failure) => add(RoomEvent.membersWatchFailed(failure)),
            (changes) => add(RoomEvent.membersUpdated(members: changes)),
          );
        });
  }

  @override
  Future<void> close() {
    _watchMembersSub?.cancel();
    return super.close();
  }
}
