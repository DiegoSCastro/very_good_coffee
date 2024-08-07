// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoffeeImage {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<int> get bytes => throw _privateConstructorUsedError;

  /// Create a copy of CoffeeImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoffeeImageCopyWith<CoffeeImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeImageCopyWith<$Res> {
  factory $CoffeeImageCopyWith(
          CoffeeImage value, $Res Function(CoffeeImage) then) =
      _$CoffeeImageCopyWithImpl<$Res, CoffeeImage>;
  @useResult
  $Res call({String id, String imageUrl, List<int> bytes});
}

/// @nodoc
class _$CoffeeImageCopyWithImpl<$Res, $Val extends CoffeeImage>
    implements $CoffeeImageCopyWith<$Res> {
  _$CoffeeImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoffeeImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? bytes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeeImageImplCopyWith<$Res>
    implements $CoffeeImageCopyWith<$Res> {
  factory _$$CoffeeImageImplCopyWith(
          _$CoffeeImageImpl value, $Res Function(_$CoffeeImageImpl) then) =
      __$$CoffeeImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String imageUrl, List<int> bytes});
}

/// @nodoc
class __$$CoffeeImageImplCopyWithImpl<$Res>
    extends _$CoffeeImageCopyWithImpl<$Res, _$CoffeeImageImpl>
    implements _$$CoffeeImageImplCopyWith<$Res> {
  __$$CoffeeImageImplCopyWithImpl(
      _$CoffeeImageImpl _value, $Res Function(_$CoffeeImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoffeeImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? bytes = null,
  }) {
    return _then(_$CoffeeImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bytes: null == bytes
          ? _value._bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$CoffeeImageImpl implements _CoffeeImage {
  const _$CoffeeImageImpl(
      {this.id = '', this.imageUrl = '', final List<int> bytes = const []})
      : _bytes = bytes;

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String imageUrl;
  final List<int> _bytes;
  @override
  @JsonKey()
  List<int> get bytes {
    if (_bytes is EqualUnmodifiableListView) return _bytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bytes);
  }

  @override
  String toString() {
    return 'CoffeeImage(id: $id, imageUrl: $imageUrl, bytes: $bytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._bytes, _bytes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, imageUrl, const DeepCollectionEquality().hash(_bytes));

  /// Create a copy of CoffeeImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeImageImplCopyWith<_$CoffeeImageImpl> get copyWith =>
      __$$CoffeeImageImplCopyWithImpl<_$CoffeeImageImpl>(this, _$identity);
}

abstract class _CoffeeImage implements CoffeeImage {
  const factory _CoffeeImage(
      {final String id,
      final String imageUrl,
      final List<int> bytes}) = _$CoffeeImageImpl;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  List<int> get bytes;

  /// Create a copy of CoffeeImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoffeeImageImplCopyWith<_$CoffeeImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
