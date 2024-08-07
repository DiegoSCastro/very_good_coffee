import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_image.freezed.dart';

///CoffeeImage Model
@freezed
class CoffeeImage with _$CoffeeImage {
  /// Constructor of [CoffeeImage]
  const factory CoffeeImage({
    @Default('') String id,
    @Default('') String imageUrl,
    @Default([]) List<int> bytes,
  }) = _CoffeeImage;
}
