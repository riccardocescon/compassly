part of 'connection_bloc.dart';

@freezed
sealed class ConnectionEvent with _$ConnectionEvent {
  const factory ConnectionEvent.memberChanged({
    required String roomCode,
    required MemberChange change,
  }) = _MemberChanged;

  const factory ConnectionEvent.locationReceived({
    required String uid,
    required LocationData locationData,
  }) = _LocationReceived;
}
