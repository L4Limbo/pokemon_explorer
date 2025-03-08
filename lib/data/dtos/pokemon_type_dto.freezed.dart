// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_type_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonTypeDto _$PokemonTypeDtoFromJson(Map<String, dynamic> json) {
  return _PokemonTypeDto.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypeDto {
  @JsonKey(name: 'type')
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PokemonTypeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeDtoCopyWith<PokemonTypeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeDtoCopyWith<$Res> {
  factory $PokemonTypeDtoCopyWith(
          PokemonTypeDto value, $Res Function(PokemonTypeDto) then) =
      _$PokemonTypeDtoCopyWithImpl<$Res, PokemonTypeDto>;
  @useResult
  $Res call({@JsonKey(name: 'type') String name});
}

/// @nodoc
class _$PokemonTypeDtoCopyWithImpl<$Res, $Val extends PokemonTypeDto>
    implements $PokemonTypeDtoCopyWith<$Res> {
  _$PokemonTypeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonTypeDtoImplCopyWith<$Res>
    implements $PokemonTypeDtoCopyWith<$Res> {
  factory _$$PokemonTypeDtoImplCopyWith(_$PokemonTypeDtoImpl value,
          $Res Function(_$PokemonTypeDtoImpl) then) =
      __$$PokemonTypeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'type') String name});
}

/// @nodoc
class __$$PokemonTypeDtoImplCopyWithImpl<$Res>
    extends _$PokemonTypeDtoCopyWithImpl<$Res, _$PokemonTypeDtoImpl>
    implements _$$PokemonTypeDtoImplCopyWith<$Res> {
  __$$PokemonTypeDtoImplCopyWithImpl(
      _$PokemonTypeDtoImpl _value, $Res Function(_$PokemonTypeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$PokemonTypeDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonTypeDtoImpl extends _PokemonTypeDto {
  _$PokemonTypeDtoImpl({@JsonKey(name: 'type') required this.name}) : super._();

  factory _$PokemonTypeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeDtoImplFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String name;

  @override
  String toString() {
    return 'PokemonTypeDto(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeDtoImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of PokemonTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeDtoImplCopyWith<_$PokemonTypeDtoImpl> get copyWith =>
      __$$PokemonTypeDtoImplCopyWithImpl<_$PokemonTypeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeDtoImplToJson(
      this,
    );
  }
}

abstract class _PokemonTypeDto extends PokemonTypeDto {
  factory _PokemonTypeDto({@JsonKey(name: 'type') required final String name}) =
      _$PokemonTypeDtoImpl;
  _PokemonTypeDto._() : super._();

  factory _PokemonTypeDto.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeDtoImpl.fromJson;

  @override
  @JsonKey(name: 'type')
  String get name;

  /// Create a copy of PokemonTypeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeDtoImplCopyWith<_$PokemonTypeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
