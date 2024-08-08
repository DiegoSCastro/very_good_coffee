import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

abstract interface class RemoveFavoriteImageUsecase {
  Future<Either<Exception, Unit>> call({required String imageUrl});
}

class RemoveFavoriteImageUsecaseImpl implements RemoveFavoriteImageUsecase {
  RemoveFavoriteImageUsecaseImpl({required FavoriteRepository repository})
      : _repository = repository;

  final FavoriteRepository _repository;

  @override
  Future<Either<Exception, Unit>> call({required String imageUrl}) async =>
      _repository.deleteFavoriteImage(imageUrl);
}
