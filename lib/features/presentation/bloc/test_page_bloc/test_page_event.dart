part of 'test_page_bloc.dart';

@freezed
sealed class TestPageEvent with _$TestPageEvent {
  const factory TestPageEvent.setup() = _Setup;
  const factory TestPageEvent.createRoom() = _CreateRoom;
  const factory TestPageEvent.leaveRoom() = _LeaveRoom;
}
