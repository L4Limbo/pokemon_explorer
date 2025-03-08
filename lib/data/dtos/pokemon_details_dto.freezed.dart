// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonDetailsDto _$PokemonDetailsDtoFromJson(Map<String, dynamic> json) {
  return _PokemonDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$PokemonDetailsDto {
  PokemonDto get pokemon => throw _privateConstructorUsedError;
  List<BasicStatDto> get basicStats => throw _privateConstructorUsedError;
  List<PokemonTypeDto> get types => throw _privateConstructorUsedError;

  /// Serializes this PokemonDetailsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDetailsDtoCopyWith<PokemonDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailsDtoCopyWith<$Res> {
  factory $PokemonDetailsDtoCopyWith(
          PokemonDetailsDto value, $Res Function(PokemonDetailsDto) then) =
      _$PokemonDetailsDtoCopyWithImpl<$Res, PokemonDetailsDto>;
  @useResult
  $Res call(
      {PokemonDto pokemon,
      List<BasicStatDto> basicStats,
      List<PokemonTypeDto> types});

  $PokemonDtoCopyWith<$Res> get pokemon;
}

/// @nodoc
class _$PokemonDetailsDtoCopyWithImpl<$Res, $Val extends PokemonDetailsDto>
    implements $PokemonDetailsDtoCopyWith<$Res> {
  _$PokemonDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemon = null,
    Object? basicStats = null,
    Object? types = null,
  }) {
    return _then(_value.copyWith(
      pokemon: null == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as PokemonDto,
      basicStats: null == basicStats
          ? _value.basicStats
          : basicStats // ignore: cast_nullable_to_non_nullable
              as List<BasicStatDto>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeDto>,
    ) as $Val);
  }

  /// Create a copy of PokemonDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonDtoCopyWith<$Res> get pokemon {
    return $PokemonDtoCopyWith<$Res>(_value.pokemon, (value) {
      return _then(_value.copyWith(pokemon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonDetailsDtoImplCopyWith<$Res>
    implements $PokemonDetailsDtoCopyWith<$Res> {
  factory _$$PokemonDetailsDtoImplCopyWith(_$PokemonDetailsDtoImpl value,
          $Res Function(_$PokemonDetailsDtoImpl) then) =
      __$$PokemonDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PokemonDto pokemon,
      List<BasicStatDto> basicStats,
      List<PokemonTypeDto> types});

  @override
  $PokemonDtoCopyWith<$Res> get pokemon;
}

/// @nodoc
class __$$PokemonDetailsDtoImplCopyWithImpl<$Res>
    extends _$PokemonDetailsDtoCopyWithImpl<$Res, _$PokemonDetailsDtoImpl>
    implements _$$PokemonDetailsDtoImplCopyWith<$Res> {
  __$$PokemonDetailsDtoImplCopyWithImpl(_$PokemonDetailsDtoImpl _value,
      $Res Function(_$PokemonDetailsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemon = null,
    Object? basicStats = null,
    Object? types = null,
  }) {
    return _then(_$PokemonDetailsDtoImpl(
      pokemon: null == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as PokemonDto,
      basicStats: null == basicStats
          ? _value._basicStats
          : basicStats // ignore: cast_nullable_to_non_nullable
              as List<BasicStatDto>,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypeDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonDetailsDtoImpl extends _PokemonDetailsDto {
  _$PokemonDetailsDtoImpl(
      {required this.pokemon,
      required final List<BasicStatDto> basicStats,
      required final List<PokemonTypeDto> types})
      : _basicStats = basicStats,
        _types = types,
        super._();

  factory _$PokemonDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonDetailsDtoImplFromJson(json);

  @override
  final PokemonDto pokemon;
  final List<BasicStatDto> _basicStats;
  @override
  List<BasicStatDto> get basicStats {
    if (_basicStats is EqualUnmodifiableListView) return _basicStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_basicStats);
  }

  final List<PokemonTypeDto> _types;
  @override
  List<PokemonTypeDto> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  String toString() {
    return 'PokemonDetailsDto(pokemon: $pokemon, basicStats: $basicStats, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDetailsDtoImpl &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon) &&
            const DeepCollectionEquality()
                .equals(other._basicStats, _basicStats) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pokemon,
      const DeepCollectionEquality().hash(_basicStats),
      const DeepCollectionEquality().hash(_types));

  /// Create a copy of PokemonDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDetailsDtoImplCopyWith<_$PokemonDetailsDtoImpl> get copyWith =>
      __$$PokemonDetailsDtoImplCopyWithImpl<_$PokemonDetailsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _PokemonDetailsDto extends PokemonDetailsDto {
  factory _PokemonDetailsDto(
      {required final PokemonDto pokemon,
      required final List<BasicStatDto> basicStats,
      required final List<PokemonTypeDto> types}) = _$PokemonDetailsDtoImpl;
  _PokemonDetailsDto._() : super._();

  factory _PokemonDetailsDto.fromJson(Map<String, dynamic> json) =
      _$PokemonDetailsDtoImpl.fromJson;

  @override
  PokemonDto get pokemon;
  @override
  List<BasicStatDto> get basicStats;
  @override
  List<PokemonTypeDto> get types;

  /// Create a copy of PokemonDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDetailsDtoImplCopyWith<_$PokemonDetailsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
