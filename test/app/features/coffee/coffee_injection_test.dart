import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockHomeRemoteDatasource extends Mock implements HomeRemoteDatasource {}

class MockFavoriteLocalDatasource extends Mock
    implements FavoriteLocalDatasource {}

class MockHomeRepository extends Mock implements HomeRepository {}

class MockFavoriteRepository extends Mock implements FavoriteRepository {}

class MockGetRandomImageUsecase extends Mock implements GetRandomImageUsecase {}

class MockGetFavoriteImagesUsecase extends Mock
    implements GetFavoriteImagesUsecase {}

class MockSaveFavoriteImageUsecase extends Mock
    implements SaveFavoriteImageUsecase {}

class MockRemoveFavoriteImageUsecase extends Mock
    implements RemoveFavoriteImageUsecase {}

class MockContainsImageUrlUsecase extends Mock
    implements ContainsImageUrlUsecase {}

class MockHomeCubit extends Mock implements HomeCubit {}

class MockFavoriteCubit extends Mock implements FavoriteCubit {}

class MockAppHttpClient extends Mock implements AppHttpClient {}

class MockDatabaseService extends Mock implements DatabaseService {}

class MockImageDownloadService extends Mock implements ImageDownloadService {}

void main() {
  setUp(() {
    injection
      ..reset()
      ..registerLazySingleton<AppHttpClient>(MockAppHttpClient.new)
      ..registerLazySingleton<DatabaseService>(MockDatabaseService.new)
      ..registerLazySingleton<ImageDownloadService>(
        MockImageDownloadService.new,
      )
      ..registerLazySingleton<HomeRemoteDatasource>(
        MockHomeRemoteDatasource.new,
      )
      ..registerLazySingleton<FavoriteLocalDatasource>(
        MockFavoriteLocalDatasource.new,
      )
      ..registerLazySingleton<HomeRepository>(MockHomeRepository.new)
      ..registerLazySingleton<FavoriteRepository>(MockFavoriteRepository.new)
      ..registerLazySingleton<GetRandomImageUsecase>(
        MockGetRandomImageUsecase.new,
      )
      ..registerLazySingleton<GetFavoriteImagesUsecase>(
        MockGetFavoriteImagesUsecase.new,
      )
      ..registerLazySingleton<SaveFavoriteImageUsecase>(
        MockSaveFavoriteImageUsecase.new,
      )
      ..registerLazySingleton<RemoveFavoriteImageUsecase>(
        MockRemoveFavoriteImageUsecase.new,
      )
      ..registerLazySingleton<ContainsImageUrlUsecase>(
        MockContainsImageUrlUsecase.new,
      )
      ..registerLazySingleton<HomeCubit>(MockHomeCubit.new)
      ..registerLazySingleton<FavoriteCubit>(MockFavoriteCubit.new);
  });

  test('should register and resolve dependencies correctly', () {
    expect(injection<AppHttpClient>(), isA<MockAppHttpClient>());
    expect(injection<DatabaseService>(), isA<MockDatabaseService>());
    expect(injection<ImageDownloadService>(), isA<MockImageDownloadService>());
    expect(injection<HomeRemoteDatasource>(), isA<MockHomeRemoteDatasource>());
    expect(
      injection<FavoriteLocalDatasource>(),
      isA<MockFavoriteLocalDatasource>(),
    );
    expect(injection<HomeRepository>(), isA<MockHomeRepository>());
    expect(injection<FavoriteRepository>(), isA<MockFavoriteRepository>());
    expect(
      injection<GetRandomImageUsecase>(),
      isA<MockGetRandomImageUsecase>(),
    );
    expect(
      injection<GetFavoriteImagesUsecase>(),
      isA<MockGetFavoriteImagesUsecase>(),
    );
    expect(
      injection<SaveFavoriteImageUsecase>(),
      isA<MockSaveFavoriteImageUsecase>(),
    );
    expect(
      injection<RemoveFavoriteImageUsecase>(),
      isA<MockRemoveFavoriteImageUsecase>(),
    );
    expect(
      injection<ContainsImageUrlUsecase>(),
      isA<MockContainsImageUrlUsecase>(),
    );
    expect(injection<HomeCubit>(), isA<MockHomeCubit>());
    expect(injection<FavoriteCubit>(), isA<MockFavoriteCubit>());
  });
}
