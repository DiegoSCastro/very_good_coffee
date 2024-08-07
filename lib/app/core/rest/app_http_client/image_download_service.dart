import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee/app/app.dart';

class ImageDownloadService {
  final AppHttpClient _httpClient;

  ImageDownloadService({required AppHttpClient httpClient})
      : _httpClient = httpClient;

  Future<Either<Exception, Uint8List>> downloadImage(String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await _httpClient.get<List<int>>(
        uri,
        extra: {'responseType': ResponseType.bytes},
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
