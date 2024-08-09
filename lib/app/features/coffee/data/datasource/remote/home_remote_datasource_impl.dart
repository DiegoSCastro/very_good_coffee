import 'package:very_good_coffee/app/app.dart';

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  const HomeRemoteDatasourceImpl({required AppHttpClient httpClient})
      : _httpClient = httpClient;
  final AppHttpClient _httpClient;

  @override
  Future<CoffeeImageModel> getRandomCoffeeImage() async {
    const apiUrl = '${AppEnv.baseUrl}/random.json';
    final response = await _httpClient.get(Uri.parse(apiUrl));
    return CoffeeImageModel.fromJson(response.data);
  }
}
