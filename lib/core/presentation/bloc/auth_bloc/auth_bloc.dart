import 'package:compassly/core/domain/repositories/auth_repository.dart';
import 'package:compassly/core/failures/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  User? _user;
  User? get user => _user;

  AuthBloc({required this._authRepository}) : super(const AuthState.init()) {
    on<_Setup>((event, emit) async {
      emit(const AuthState.loading());

      final result = await _authRepository.auth();

      result.fold((l) => emit(AuthState.error(l)), (r) {
        _user = r;
        emit(AuthState.authenticated(r));
      });
    });
  }
}
