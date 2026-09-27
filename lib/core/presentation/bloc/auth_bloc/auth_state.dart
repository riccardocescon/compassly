part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.init() = _Init;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.error(Failure failure) = _Error;
}
