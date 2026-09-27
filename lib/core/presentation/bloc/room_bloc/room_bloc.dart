import 'package:compassly/core/domain/entities/member.dart';
import 'package:compassly/core/domain/entities/room.dart';
import 'package:compassly/core/domain/repositories/room_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:compassly/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:compassly/core/presentation/usecase/create_room.dart';
import 'package:compassly/core/presentation/usecase/leave_room.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_event.dart';
part 'room_state.dart';
part 'room_bloc.freezed.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final CreateRoomUsecase _createRoom;
  final LeaveRoomUsecase _leaveRoom;

  final AuthBloc _authBloc;

  Room? _room;

  RoomBloc({
    required this._authBloc,
    required this._createRoom,
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
        CreateRoomUsecaseParams(
          uid: user.uid,
          member: Member(name: user.displayName ?? 'Anonymous'),
        ),
      );

      room.fold((l) => emit(RoomState.error(failure: l)), (r) {
        _room = r;
        emit(RoomState.data(room: r));
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

      // TODO: join
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
        LeaveRoomUsecaseParams(
          uid: user.uid,
          code: _room!.code,
          memberCount: _room?.members.length ?? 0,
        ),
      );

      foLeave.fold((l) => emit(RoomState.error(failure: l)), (r) {
        _room = null;
        emit(const RoomState.data(room: null));
      });
    });
  }
}
