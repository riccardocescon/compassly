part of 'connection_bloc.dart';

@freezed
sealed class ConnectionEvent with _$ConnectionEvent {
  const factory ConnectionEvent.memberChanged({
    required String roomCode,
    required MemberChange change,
  }) = _MemberChanged;
}
