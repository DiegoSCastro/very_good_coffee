import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_coffee/app/app.dart';

part 'favorite_state.freezed.dart';

@freezed
sealed class FavoriteState with _$FavoriteState {
  factory FavoriteState.initial() = FavoriteInitial;
  factory FavoriteState.loading() = FavoriteLoading;
  factory FavoriteState.saved() = FavoriteSaved;
  factory FavoriteState.success({required List<CoffeeImage> coffeImages}) =
      FavoriteSuccess;
  factory FavoriteState.error({required String errorMessage}) = FavoriteError;
}
