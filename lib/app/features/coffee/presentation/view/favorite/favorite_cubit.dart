import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee/app/app.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final SaveFavoriteImageUsecase _saveFavoriteImageUsecase;
  final GetFavoriteImagesUsecase _getFavoriteImagesUsecase;
  final RemoveFavoriteImageUsecase _removeFavoriteImageUsecase;
  FavoriteCubit({
    required SaveFavoriteImageUsecase saveFavoriteImageUsecase,
    required GetFavoriteImagesUsecase getFavoriteImagesUsecase,
    required RemoveFavoriteImageUsecase removeFavoriteImageUsecase,
  })  : _saveFavoriteImageUsecase = saveFavoriteImageUsecase,
        _getFavoriteImagesUsecase = getFavoriteImagesUsecase,
        _removeFavoriteImageUsecase = removeFavoriteImageUsecase,
        super(FavoriteState.initial());

  Future<void> getFavoriteImages() async {
    emit(FavoriteState.loading());
    final result = await _getFavoriteImagesUsecase();
    result.fold(
      (_) => emit(FavoriteState.error(errorMessage: 'Error loading images')),
      (coffeImages) {
        emit(FavoriteState.success(coffeImages: coffeImages));
      },
    );
  }

  Future<void> saveFavoriteImage({required String imageUrl}) async {
    emit(FavoriteState.loading());
    final result = await _saveFavoriteImageUsecase(imageUrl: imageUrl);
    result.fold(
      (_) => emit(FavoriteState.error(errorMessage: 'Error saving favorite')),
      (_) {
        emit(FavoriteState.saved());
        emit(FavoriteState.success(coffeImages: []));
      },
    );
  }

  Future<void> removeFavoriteImage({required String imageId}) async {
    final result = await _removeFavoriteImageUsecase(id: imageId);
    result.fold(
      (_) => emit(FavoriteState.error(errorMessage: 'Error removing favorite')),
      (_) => null,
    );
  }
}
