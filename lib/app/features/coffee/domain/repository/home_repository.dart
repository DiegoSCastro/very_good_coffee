import 'package:fpdart/fpdart.dart';

abstract interface class HomeRepository {
  Future<Either<Exception, String>> getRandomCoffeeImageUrl();
}
