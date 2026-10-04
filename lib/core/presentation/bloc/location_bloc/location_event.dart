part of 'location_bloc.dart';

@freezed
sealed class LocationEvent with _$LocationEvent {
  const factory LocationEvent.start() = _Start;
  const factory LocationEvent.update(LocationData location) = _Update;
  const factory LocationEvent.stop() = _Stop;
  const factory LocationEvent.failed(String message) = _Failed;
}
