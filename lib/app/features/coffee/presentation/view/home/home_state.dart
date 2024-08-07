import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  factory HomeState.initial() = HomeInitial;
  factory HomeState.loading() = HomeLoading;
  factory HomeState.success({required String fileUrl}) = HomeSuccess;
  factory HomeState.error({required String errorMessage}) = HomeError;
}
