// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_stat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BasicStatDto _$BasicStatDtoFromJson(Map<String, dynamic> json) {
  return _BasicStatDto.fromJson(json);
}

/// @nodoc
mixin _$BasicStatDto {
  int get value => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this BasicStatDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BasicStatDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasicStatDtoCopyWith<BasicStatDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicStatDtoCopyWith<$Res> {
  factory $BasicStatDtoCopyWith(
          BasicStatDto value, $Res Function(BasicStatDto) then) =
      _$BasicStatDtoCopyWithImpl<$Res, BasicStatDto>;
  @useResult
  $Res call({int value, String name});
}

/// @nodoc
class _$BasicStatDtoCopyWithImpl<$Res, $Val extends BasicStatDto>
    implements $BasicStatDtoCopyWith<$Res> {
  _$BasicStatDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasicStatDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasicStatDtoImplCopyWith<$Res>
    implements $BasicStatDtoCopyWith<$Res> {
  factory _$$BasicStatDtoImplCopyWith(
          _$BasicStatDtoImpl value, $Res Function(_$BasicStatDtoImpl) then) =
      __$$BasicStatDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, String name});
}

/// @nodoc
class __$$BasicStatDtoImplCopyWithImpl<$Res>
    extends _$BasicStatDtoCopyWithImpl<$Res, _$BasicStatDtoImpl>
    implements _$$BasicStatDtoImplCopyWith<$Res> {
  __$$BasicStatDtoImplCopyWithImpl(
      _$BasicStatDtoImpl _value, $Res Function(_$BasicStatDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BasicStatDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? name = null,
  }) {
    return _then(_$BasicStatDtoImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicStatDtoImpl extends _BasicStatDto {
  _$BasicStatDtoImpl({required this.value, required this.name}) : super._();

  factory _$BasicStatDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasicStatDtoImplFromJson(json);

  @override
  final int value;
  @override
  final String name;

  @override
  String toString() {
    return 'BasicStatDto(value: $value, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicStatDtoImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, name);

  /// Create a copy of BasicStatDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicStatDtoImplCopyWith<_$BasicStatDtoImpl> get copyWith =>
      __$$BasicStatDtoImplCopyWithImpl<_$BasicStatDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicStatDtoImplToJson(
      this,
    );
  }
}

abstract class _BasicStatDto extends BasicStatDto {
  factory _BasicStatDto(
      {required final int value,
      required final String name}) = _$BasicStatDtoImpl;
  _BasicStatDto._() : super._();

  factory _BasicStatDto.fromJson(Map<String, dynamic> json) =
      _$BasicStatDtoImpl.fromJson;

  @override
  int get value;
  @override
  String get name;

  /// Create a copy of BasicStatDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasicStatDtoImplCopyWith<_$BasicStatDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
