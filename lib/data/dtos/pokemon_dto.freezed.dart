// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonDto _$PokemonDtoFromJson(Map<String, dynamic> json) {
  return _PokemonDto.fromJson(json);
}

/// @nodoc
mixin _$PokemonDto {
  String get name => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;

  /// Serializes this PokemonDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDtoCopyWith<PokemonDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDtoCopyWith<$Res> {
  factory $PokemonDtoCopyWith(
          PokemonDto value, $Res Function(PokemonDto) then) =
      _$PokemonDtoCopyWithImpl<$Res, PokemonDto>;
  @useResult
  $Res call({String name, String? imagePath});
}

/// @nodoc
class _$PokemonDtoCopyWithImpl<$Res, $Val extends PokemonDto>
    implements $PokemonDtoCopyWith<$Res> {
  _$PokemonDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonDtoImplCopyWith<$Res>
    implements $PokemonDtoCopyWith<$Res> {
  factory _$$PokemonDtoImplCopyWith(
          _$PokemonDtoImpl value, $Res Function(_$PokemonDtoImpl) then) =
      __$$PokemonDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? imagePath});
}

/// @nodoc
class __$$PokemonDtoImplCopyWithImpl<$Res>
    extends _$PokemonDtoCopyWithImpl<$Res, _$PokemonDtoImpl>
    implements _$$PokemonDtoImplCopyWith<$Res> {
  __$$PokemonDtoImplCopyWithImpl(
      _$PokemonDtoImpl _value, $Res Function(_$PokemonDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imagePath = freezed,
  }) {
    return _then(_$PokemonDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonDtoImpl extends _PokemonDto {
  _$PokemonDtoImpl({required this.name, this.imagePath}) : super._();

  factory _$PokemonDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String? imagePath;

  @override
  String toString() {
    return 'PokemonDto(name: $name, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, imagePath);

  /// Create a copy of PokemonDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDtoImplCopyWith<_$PokemonDtoImpl> get copyWith =>
      __$$PokemonDtoImplCopyWithImpl<_$PokemonDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonDtoImplToJson(
      this,
    );
  }
}

abstract class _PokemonDto extends PokemonDto {
  factory _PokemonDto({required final String name, final String? imagePath}) =
      _$PokemonDtoImpl;
  _PokemonDto._() : super._();

  factory _PokemonDto.fromJson(Map<String, dynamic> json) =
      _$PokemonDtoImpl.fromJson;

  @override
  String get name;
  @override
  String? get imagePath;

  /// Create a copy of PokemonDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDtoImplCopyWith<_$PokemonDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
