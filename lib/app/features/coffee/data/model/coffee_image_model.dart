import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_coffee/app/app.dart';

part 'coffee_image_model.freezed.dart';
part 'coffee_image_model.g.dart';

///CoffeeImageModel Model
@freezed
class CoffeeImageModel with _$CoffeeImageModel {
  /// Constructor of [CoffeeImageModel]
  const factory CoffeeImageModel({
    @Default('') String id,
    @JsonKey(name: 'file') @Default('') String imageUrl,
    @Default('') String localPath,
    @Default([]) List<int> bytes,
  }) = _CoffeeImageModel;
  const CoffeeImageModel._();

  /// Convert json [Map] in a [CoffeeImageModel]
  factory CoffeeImageModel.fromJson(Map<String, dynamic> json) =>
      _$CoffeeImageModelFromJson(json);

  /// Convert [CoffeeImage] to [CoffeeImageModel] model
  factory CoffeeImageModel.fromEntity(
    CoffeeImage coffeeImage,
  ) =>
      CoffeeImageModel(
        id: coffeeImage.id,
        imageUrl: coffeeImage.imageUrl,
        localPath: coffeeImage.localPath,
        bytes: coffeeImage.bytes,
      );

  /// Convert [CoffeeImageModel] to [CoffeeImage] entity
  CoffeeImage toEntity() => CoffeeImage(
        id: id,
        imageUrl: imageUrl,
        localPath: localPath,
        bytes: bytes,
      );
}
