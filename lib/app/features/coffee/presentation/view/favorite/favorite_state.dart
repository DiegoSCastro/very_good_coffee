import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.freezed.dart';

@freezed
sealed class FavoriteState with _$FavoriteState {
  factory FavoriteState.initial() = FavoriteInitial;
  factory FavoriteState.loading() = FavoriteLoading;
  factory FavoriteState.saved() = FavoriteSaved;
  factory FavoriteState.success({required List<File> files}) = FavoriteSuccess;
  factory FavoriteState.error({required String errorMessage}) = FavoriteError;
}
