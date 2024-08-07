import 'package:get_it/get_it.dart';

import 'package:very_good_coffee/app/app.dart';

final injection = GetIt.instance;

void initInjection() {
  injection
    ..registerLazySingleton<AppHttpClient>(DioClient.new)
    ..registerLazySingleton<DatabaseService>(() => DatabaseService.instance)
    ..registerLazySingleton<ImageDownloadService>(
      () => ImageDownloadService(httpClient: injection<AppHttpClient>()),
    );
  CoffeeInjection.call();
}
