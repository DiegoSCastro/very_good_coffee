import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockAppHttpClient extends Mock implements AppHttpClient {}

class MockDatabaseService extends Mock implements DatabaseService {}

class MockFavoriteRepository extends Mock implements FavoriteRepository {}

void main() {
  group('Injection', () {
    setUp(() {
      GetIt.instance.reset(); // Reset GetIt before each test
    });

    test('should register LocaleCubit', () {
      initInjection();

      final localeCubit = GetIt.instance<LocaleCubit>();
      expect(localeCubit, isA<LocaleCubit>());
    });
  });
}
