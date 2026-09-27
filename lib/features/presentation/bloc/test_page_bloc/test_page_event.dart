part of 'test_page_bloc.dart';

@freezed
sealed class TestPageEvent with _$TestPageEvent {
  const factory TestPageEvent.setup() = _Setup;
}
