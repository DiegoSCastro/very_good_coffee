import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

abstract interface class ContainsImageUrlUsecase {
  Future<Either<Exception, bool>> call({required String imageUrl});
}

class ContainsImageUrlUsecaseImpl implements ContainsImageUrlUsecase {
  ContainsImageUrlUsecaseImpl({required FavoriteRepository repository})
      : _repository = repository;

  final FavoriteRepository _repository;
  @override
  Future<Either<Exception, bool>> call({required String imageUrl}) {
    return _repository.containsImageUrl(imageUrl);
  }
}
