part of 'room_bloc.dart';

@freezed
sealed class RoomEvent with _$RoomEvent {
  const factory RoomEvent.create() = _Create;
  const factory RoomEvent.join(String code) = _Join;
  const factory RoomEvent.leave() = _Leave;
}
