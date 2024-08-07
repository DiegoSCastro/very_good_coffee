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
      ..registerLazySingleton<FavoriteRepository>(
        () => FavoriteRepositoryImpl(
          localDataSource: injection<FavoriteLocalDatasource>(),
        ),
      )
      ..registerLazySingleton<GetRandomImageUsecase>(
        () => GetRandomImageUsecaseImpl(
          repository: injection<HomeRepository>(),
        ),
      )
      ..registerLazySingleton<GetFavoriteImagesUsecase>(
        () => GetFavoriteImagesUsecaseImpl(
          repository: injection<FavoriteRepository>(),
        ),
      )
      ..registerLazySingleton<SaveFavoriteImageUsecase>(
        () => SaveFavoriteImageUsecaseImpl(
          repository: injection<FavoriteRepository>(),
          imageDownloadService: injection<ImageDownloadService>(),
        ),
      )
      ..registerLazySingleton<HomeCubit>(
        () => HomeCubit(
          getRandomImageUsecase: injection<GetRandomImageUsecase>(),
        ),
      )
      ..registerLazySingleton<FavoriteCubit>(
        () => FavoriteCubit(
          getFavoriteImagesUsecase: injection<GetFavoriteImagesUsecase>(),
          saveFavoriteImageUsecase: injection<SaveFavoriteImageUsecase>(),
        ),
      );
  }
}
