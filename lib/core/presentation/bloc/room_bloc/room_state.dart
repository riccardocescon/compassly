part of 'room_bloc.dart';

@freezed
sealed class RoomState with _$RoomState {
  const factory RoomState.init() = _Init;
  const factory RoomState.loading() = _Loading;
  const factory RoomState.data({Room? room}) = _Data;
  const factory RoomState.error({required Failure failure}) = _Error;
}
