part of 'connection_bloc.dart';

@freezed
sealed class ConnectionState with _$ConnectionState {
  const factory ConnectionState.init() = _Init;
  const factory ConnectionState.loading() = _Loading;
  const factory ConnectionState.error() = _Error;
}
