import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_coffee/app/app.dart';

class MockHomeRemoteDatasource extends Mock implements HomeRemoteDatasource {}

void main() {
  late HomeRepositoryImpl repository;
  late MockHomeRemoteDatasource mockRemoteDatasource;

  setUp(() {
    mockRemoteDatasource = MockHomeRemoteDatasource();
    repository = HomeRepositoryImpl(remoteDatasource: mockRemoteDatasource);
  });

  group('HomeRepositoryImpl', () {
    const imageUrl = 'https://coffee.alexflipnote.dev/random';

    test(
        'should return Right with imageUrl when getRandomCoffeeImageUrl'
        ' is successful', () async {
      when(() => mockRemoteDatasource.getRandomCoffeeImage()).thenAnswer(
        (_) async =>
            CoffeeImageModel.fromEntity(const CoffeeImage(imageUrl: imageUrl)),
      );

      final result = await repository.getRandomCoffeeImageUrl();

      expect(result, equals(const Right<Exception, String>(imageUrl)));
      verify(() => mockRemoteDatasource.getRandomCoffeeImage()).called(1);
    });

    test('should return Left with HttpException when DioException is thrown',
        () async {
      final dioException =
          DioException(requestOptions: RequestOptions(path: imageUrl));
      when(() => mockRemoteDatasource.getRandomCoffeeImage())
          .thenThrow(dioException);

      final result = await repository.getRandomCoffeeImageUrl();

      expect(result.isLeft(), isTrue);
      result.fold(
        (exception) => expect(exception, isA<HttpException>()),
        (_) => fail('Expected a Left with HttpException'),
      );
      verify(() => mockRemoteDatasource.getRandomCoffeeImage()).called(1);
    });

    test('should return Left with Exception when generic Exception is thrown',
        () async {
      final genericException = Exception('Unexpected error');
      when(() => mockRemoteDatasource.getRandomCoffeeImage())
          .thenThrow(genericException);

      final result = await repository.getRandomCoffeeImageUrl();

      expect(result.isLeft(), isTrue);
      result.fold(
        (exception) => expect(exception, isA<Exception>()),
        (_) => fail('Expected a Left with Exception'),
      );
      verify(() => mockRemoteDatasource.getRandomCoffeeImage()).called(1);
    });
  });
}
