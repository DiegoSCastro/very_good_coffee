import 'package:very_good_coffee/app/app.dart';

abstract interface class HomeRemoteDatasource {
  Future<CoffeeImageModel> getRandomCoffeeImage();
}
