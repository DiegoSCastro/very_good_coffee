// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoffeeImageModel _$CoffeeImageModelFromJson(Map<String, dynamic> json) {
  return _CoffeeImageModel.fromJson(json);
}

/// @nodoc
mixin _$CoffeeImageModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'file')
  String get imageUrl => throw _privateConstructorUsedError;
  String get localPath => throw _privateConstructorUsedError;
  List<int> get bytes => throw _privateConstructorUsedError;

  /// Serializes this CoffeeImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoffeeImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoffeeImageModelCopyWith<CoffeeImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoffeeImageModelCopyWith<$Res> {
  factory $CoffeeImageModelCopyWith(
          CoffeeImageModel value, $Res Function(CoffeeImageModel) then) =
      _$CoffeeImageModelCopyWithImpl<$Res, CoffeeImageModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'file') String imageUrl,
      String localPath,
      List<int> bytes});
}

/// @nodoc
class _$CoffeeImageModelCopyWithImpl<$Res, $Val extends CoffeeImageModel>
    implements $CoffeeImageModelCopyWith<$Res> {
  _$CoffeeImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoffeeImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? localPath = null,
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
      localPath: null == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
      bytes: null == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoffeeImageModelImplCopyWith<$Res>
    implements $CoffeeImageModelCopyWith<$Res> {
  factory _$$CoffeeImageModelImplCopyWith(_$CoffeeImageModelImpl value,
          $Res Function(_$CoffeeImageModelImpl) then) =
      __$$CoffeeImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'file') String imageUrl,
      String localPath,
      List<int> bytes});
}

/// @nodoc
class __$$CoffeeImageModelImplCopyWithImpl<$Res>
    extends _$CoffeeImageModelCopyWithImpl<$Res, _$CoffeeImageModelImpl>
    implements _$$CoffeeImageModelImplCopyWith<$Res> {
  __$$CoffeeImageModelImplCopyWithImpl(_$CoffeeImageModelImpl _value,
      $Res Function(_$CoffeeImageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoffeeImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? localPath = null,
    Object? bytes = null,
  }) {
    return _then(_$CoffeeImageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      localPath: null == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
      bytes: null == bytes
          ? _value._bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoffeeImageModelImpl extends _CoffeeImageModel {
  const _$CoffeeImageModelImpl(
      {this.id = '',
      @JsonKey(name: 'file') this.imageUrl = '',
      this.localPath = '',
      final List<int> bytes = const []})
      : _bytes = bytes,
        super._();

  factory _$CoffeeImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoffeeImageModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'file')
  final String imageUrl;
  @override
  @JsonKey()
  final String localPath;
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
    return 'CoffeeImageModel(id: $id, imageUrl: $imageUrl, localPath: $localPath, bytes: $bytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoffeeImageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            const DeepCollectionEquality().equals(other._bytes, _bytes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl, localPath,
      const DeepCollectionEquality().hash(_bytes));

  /// Create a copy of CoffeeImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoffeeImageModelImplCopyWith<_$CoffeeImageModelImpl> get copyWith =>
      __$$CoffeeImageModelImplCopyWithImpl<_$CoffeeImageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoffeeImageModelImplToJson(
      this,
    );
  }
}

abstract class _CoffeeImageModel extends CoffeeImageModel {
  const factory _CoffeeImageModel(
      {final String id,
      @JsonKey(name: 'file') final String imageUrl,
      final String localPath,
      final List<int> bytes}) = _$CoffeeImageModelImpl;
  const _CoffeeImageModel._() : super._();

  factory _CoffeeImageModel.fromJson(Map<String, dynamic> json) =
      _$CoffeeImageModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'file')
  String get imageUrl;
  @override
  String get localPath;
  @override
  List<int> get bytes;

  /// Create a copy of CoffeeImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoffeeImageModelImplCopyWith<_$CoffeeImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
