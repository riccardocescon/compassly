part of 'location_bloc.dart';

@freezed
sealed class LocationState with _$LocationState {
  const factory LocationState.init() = _Init;
  const factory LocationState.loading() = _Loading;
  const factory LocationState.data({required String data}) = _Data;
  const factory LocationState.error({required String message}) = _Error;
}
