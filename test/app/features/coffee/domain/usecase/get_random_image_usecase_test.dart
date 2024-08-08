import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetRandomImageUsecaseImpl getRandomImageUsecase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getRandomImageUsecase =
        GetRandomImageUsecaseImpl(repository: mockHomeRepository);
  });

  const tImageUrl = 'https://example.com/coffee.jpg';

  test('should return Right(String) when getting random image URL succeeds',
      () async {
    when(() => mockHomeRepository.getRandomCoffeeImageUrl())
        .thenAnswer((_) async => const Right(tImageUrl));
    final result = await getRandomImageUsecase.call();

    expect(result, equals(const Right(tImageUrl)));
    verify(() => mockHomeRepository.getRandomCoffeeImageUrl()).called(1);
  });

  test('should return Left(Exception) when getting random image URL fails',
      () async {
    final exception = Exception('Failed to get image');
    when(() => mockHomeRepository.getRandomCoffeeImageUrl())
        .thenAnswer((_) async => Left(exception));

    final result = await getRandomImageUsecase.call();

    expect(result, equals(Left(exception)));
    verify(() => mockHomeRepository.getRandomCoffeeImageUrl()).called(1);
  });
}
