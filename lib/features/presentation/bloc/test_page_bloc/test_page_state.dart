part of 'test_page_bloc.dart';

@freezed
sealed class TestPageState with _$TestPageState {
  const factory TestPageState.init() = _Init;
  const factory TestPageState.loading() = _Loading;
  const factory TestPageState.ui({required String uid}) = _Ui;
  const factory TestPageState.error({required String message}) = _Error;
}
