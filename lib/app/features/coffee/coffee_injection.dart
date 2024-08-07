import 'package:very_good_coffee/app/app.dart';

class CoffeeInjection {
  static Future<void> call() async {
    injection
      ..registerLazySingleton<HomeRemoteDatasource>(
        () => HomeRemoteDatasourceImpl(
          httpClient: injection<AppHttpClient>(),
        ),
      )
      ..registerLazySingleton<FavoriteLocalDatasource>(
        () => FavoriteLocalDatasourceImpl(
          databaseService: injection<DatabaseService>(),
        ),
      )
      ..registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(
          remoteDatasource: injection<HomeRemoteDatasource>(),
        ),
      )
      ..registerLazySingleton<GetRandomImageUsecase>(
        () => GetRandomImageUsecaseImpl(
          repository: injection<HomeRepository>(),
        ),
      )
      ..registerLazySingleton<HomeCubit>(
        () => HomeCubit(
          getRandomImageUsecase: injection<GetRandomImageUsecase>(),
        ),
      );
  }
}
