import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

abstract interface class GetFavoriteImagesUsecase {
  Future<Either<Exception, List<CoffeeImage>>> call();
}

class GetFavoriteImagesUsecaseImpl implements GetFavoriteImagesUsecase {
  GetFavoriteImagesUsecaseImpl({required FavoriteRepository repository})
      : _repository = repository;

  final FavoriteRepository _repository;
  @override
  Future<Either<Exception, List<CoffeeImage>>> call() =>
      _repository.getFavoriteImages();
}
