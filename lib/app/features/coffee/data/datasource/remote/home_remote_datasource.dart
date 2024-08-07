import 'package:very_good_coffee/app/app.dart';

abstract interface class HomeRemoteDatasource {
  Future<CoffeeImageModel> getRandomCoffeeImage();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final AppHttpClient _httpClient;

  const HomeRemoteDatasourceImpl({required AppHttpClient httpClient})
      : _httpClient = httpClient;

  @override
  Future<CoffeeImageModel> getRandomCoffeeImage() async {
    const apiUrl = '${AppEnv.baseUrl}/random.json';
    final response = await _httpClient.get(Uri.parse(apiUrl));
    return CoffeeImageModel.fromJson(response.data);
  }
}
