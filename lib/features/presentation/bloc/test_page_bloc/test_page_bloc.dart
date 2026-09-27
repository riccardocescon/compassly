import 'package:compassly/core/domain/entities/room.dart';
import 'package:compassly/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:compassly/core/presentation/bloc/room_bloc/room_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_page_event.dart';
part 'test_page_state.dart';
part 'test_page_bloc.freezed.dart';

class TestPageBloc extends Bloc<TestPageEvent, TestPageState> {
  final AuthBloc _authBloc;
  final RoomBloc _roomBloc;

  User? _user;

  TestPageBloc({required this._authBloc, required this._roomBloc})
    : super(const TestPageState.init()) {
    on<_Setup>((event, emit) async {
      emit(const TestPageState.loading());
      final authState = await _authBloc.stream.firstWhere(
        (s) => s.maybeMap(
          authenticated: (_) => true,
          error: (_) => true,
          orElse: () => false,
        ),
      );
      authState.maybeMap(
        authenticated: (v) {
          _user = v.user;
          emit(TestPageState.ui(uid: v.user.uid));
        },
        error: (v) => emit(TestPageState.error(message: v.failure.message)),
        orElse: () {},
      );
    });

    on<_CreateRoom>((event, emit) async {
      emit(const TestPageState.loading());

      _roomBloc.add(const RoomEvent.create());
      final roomState = await _roomBloc.stream.firstWhere(
        (s) => s.maybeMap(
          data: (_) => true,
          error: (_) => true,
          orElse: () => false,
        ),
      );

      roomState.maybeMap(
        data: (v) => emit(TestPageState.ui(uid: _user!.uid, room: v.room)),
        error: (v) => emit(TestPageState.error(message: v.failure.message)),
        orElse: () {},
      );
    });

    on<_LeaveRoom>((event, emit) async {
      emit(const TestPageState.loading());

      _roomBloc.add(const RoomEvent.leave());
      final roomState = await _roomBloc.stream.firstWhere(
        (s) => s.maybeMap(
          data: (_) => true,
          error: (_) => true,
          orElse: () => false,
        ),
      );

      roomState.maybeMap(
        data: (_) => emit(TestPageState.ui(uid: _user!.uid)),
        error: (v) => emit(TestPageState.error(message: v.failure.message)),
        orElse: () {},
      );
    });
  }
}
