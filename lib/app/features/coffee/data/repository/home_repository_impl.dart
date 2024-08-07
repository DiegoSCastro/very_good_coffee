import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required HomeRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  final HomeRemoteDatasource _remoteDatasource;
  @override
  Future<Either<Exception, String>> getRandomCoffeeImageUrl() async {
    try {
      final result = await _remoteDatasource.getRandomCoffeeImage();
      return Right(result.imageUrl);
    } on DioException catch (e) {
      return Left(HttpException(e.toString()));
    } on Exception catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
