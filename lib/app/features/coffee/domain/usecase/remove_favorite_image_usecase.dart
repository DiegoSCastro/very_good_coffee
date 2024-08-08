import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

abstract interface class RemoveFavoriteImageUsecase {
  Future<Either<Exception, bool>> call({required String id});
}

class RemoveFavoriteImageUsecaseImpl implements RemoveFavoriteImageUsecase {
  RemoveFavoriteImageUsecaseImpl({required FavoriteRepository repository})
      : _repository = repository;

  final FavoriteRepository _repository;

  @override
  Future<Either<Exception, bool>> call({required String id}) async =>
      _repository.deleteFavoriteImage(id);
}
