import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class ImageDownloadService {
  final Dio _dio = Dio();

  Future<Either<Exception, Uint8List>> downloadImage(String url) async {
    try {
      final response = await _dio.get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      if (response.statusCode == 200) {
        log(Uint8List.fromList(response.data!).toString());
        return right(Uint8List.fromList(response.data!));
      } else {
        return left(
          Exception('Error downloading image: ${response.statusCode}'),
        );
      }
    } catch (e) {
      return left(Exception('Error downloading image: $e'));
    }
  }
}
