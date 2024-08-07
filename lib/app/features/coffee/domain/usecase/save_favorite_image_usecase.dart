import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

abstract interface class SaveFavoriteImageUsecase {
  Future<Either<Exception, bool>> call({required String imageUrl});
}

class SaveFavoriteImageUsecaseImpl implements SaveFavoriteImageUsecase {
  SaveFavoriteImageUsecaseImpl({
    required FavoriteRepository repository,
    required ImageDownloadService imageDownloadService,
  })  : _repository = repository,
        _imageDownloadService = imageDownloadService;

  final FavoriteRepository _repository;
  final ImageDownloadService _imageDownloadService;

  @override
  Future<Either<Exception, bool>> call({required String imageUrl}) async {
    final downloadResult = await _imageDownloadService.downloadImage(imageUrl);
    return downloadResult.fold(
      left,
      (bytes) {
        final coffeeImage = CoffeeImage(imageUrl: imageUrl, bytes: bytes);
        return _repository.saveFavoriteImage(coffeeImage);
      },
    );
  }
}
