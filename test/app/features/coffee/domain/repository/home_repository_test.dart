import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  group('HomeRepository', () {
    late MockHomeRepository homeRepository;

    setUp(() {
      homeRepository = MockHomeRepository();
    });

    test('getRandomCoffeeImageUrl should return Either<Exception, String>',
        () async {
      // Arrange
      when(() => homeRepository.getRandomCoffeeImageUrl()).thenAnswer(
        (_) async => const Right('https://example.com/coffee.jpg'),
      );

      // Act
      final result = await homeRepository.getRandomCoffeeImageUrl();

      // Assert
      expect(result.isRight(), true);
      expect(result.getOrElse((e) => ''), isA<String>());
    });
  });
}
