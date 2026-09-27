import 'package:compassly/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_page_event.dart';
part 'test_page_state.dart';
part 'test_page_bloc.freezed.dart';

class TestPageBloc extends Bloc<TestPageEvent, TestPageState> {
  final AuthBloc authBloc;

  TestPageBloc({required this.authBloc}) : super(const TestPageState.init()) {
    on<_Setup>((event, emit) async {
      emit(const TestPageState.loading());
      authBloc.add(const AuthEvent.setup());
      final authState = await authBloc.stream.firstWhere(
        (s) => s.maybeMap(
          authenticated: (_) => true,
          error: (_) => true,
          orElse: () => false,
        ),
      );
      authState.maybeMap(
        authenticated: (v) => emit(TestPageState.ui(uid: v.user.uid)),
        error: (v) => emit(TestPageState.error(message: v.failure.message)),
        orElse: () {},
      );
    });
  }
}
