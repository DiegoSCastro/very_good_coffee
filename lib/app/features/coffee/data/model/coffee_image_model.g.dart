// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoffeeImageModelImpl _$$CoffeeImageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CoffeeImageModelImpl(
      id: json['id'] as String? ?? '',
      imageUrl: json['file'] as String? ?? '',
      localPath: json['localPath'] as String? ?? '',
      bytes: (json['bytes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CoffeeImageModelImplToJson(
        _$CoffeeImageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file': instance.imageUrl,
      'localPath': instance.localPath,
      'bytes': instance.bytes,
    };
