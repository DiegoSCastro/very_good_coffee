import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

abstract interface class GetRandomImageUsecase {
  Future<Either<Exception, String>> call();
}

class GetRandomImageUsecaseImpl implements GetRandomImageUsecase {
  GetRandomImageUsecaseImpl({required HomeRepository repository})
      : _repository = repository;

  final HomeRepository _repository;

  @override
  Future<Either<Exception, String>> call() async =>
      _repository.getRandomCoffeeImageUrl();
}
