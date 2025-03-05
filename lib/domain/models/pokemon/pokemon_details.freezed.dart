// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonDetails {
  Pokemon get pokemon => throw _privateConstructorUsedError;
  List<BasicStat> get basicStats => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDetailsCopyWith<PokemonDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailsCopyWith<$Res> {
  factory $PokemonDetailsCopyWith(
          PokemonDetails value, $Res Function(PokemonDetails) then) =
      _$PokemonDetailsCopyWithImpl<$Res, PokemonDetails>;
  @useResult
  $Res call({Pokemon pokemon, List<BasicStat> basicStats});

  $PokemonCopyWith<$Res> get pokemon;
}

/// @nodoc
class _$PokemonDetailsCopyWithImpl<$Res, $Val extends PokemonDetails>
    implements $PokemonDetailsCopyWith<$Res> {
  _$PokemonDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemon = null,
    Object? basicStats = null,
  }) {
    return _then(_value.copyWith(
      pokemon: null == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon,
      basicStats: null == basicStats
          ? _value.basicStats
          : basicStats // ignore: cast_nullable_to_non_nullable
              as List<BasicStat>,
    ) as $Val);
  }

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonCopyWith<$Res> get pokemon {
    return $PokemonCopyWith<$Res>(_value.pokemon, (value) {
      return _then(_value.copyWith(pokemon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonDetailsImplCopyWith<$Res>
    implements $PokemonDetailsCopyWith<$Res> {
  factory _$$PokemonDetailsImplCopyWith(_$PokemonDetailsImpl value,
          $Res Function(_$PokemonDetailsImpl) then) =
      __$$PokemonDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pokemon pokemon, List<BasicStat> basicStats});

  @override
  $PokemonCopyWith<$Res> get pokemon;
}

/// @nodoc
class __$$PokemonDetailsImplCopyWithImpl<$Res>
    extends _$PokemonDetailsCopyWithImpl<$Res, _$PokemonDetailsImpl>
    implements _$$PokemonDetailsImplCopyWith<$Res> {
  __$$PokemonDetailsImplCopyWithImpl(
      _$PokemonDetailsImpl _value, $Res Function(_$PokemonDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemon = null,
    Object? basicStats = null,
  }) {
    return _then(_$PokemonDetailsImpl(
      pokemon: null == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon,
      basicStats: null == basicStats
          ? _value._basicStats
          : basicStats // ignore: cast_nullable_to_non_nullable
              as List<BasicStat>,
    ));
  }
}

/// @nodoc

class _$PokemonDetailsImpl implements _PokemonDetails {
  const _$PokemonDetailsImpl(
      {required this.pokemon, required final List<BasicStat> basicStats})
      : _basicStats = basicStats;

  @override
  final Pokemon pokemon;
  final List<BasicStat> _basicStats;
  @override
  List<BasicStat> get basicStats {
    if (_basicStats is EqualUnmodifiableListView) return _basicStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_basicStats);
  }

  @override
  String toString() {
    return 'PokemonDetails(pokemon: $pokemon, basicStats: $basicStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDetailsImpl &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon) &&
            const DeepCollectionEquality()
                .equals(other._basicStats, _basicStats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, pokemon, const DeepCollectionEquality().hash(_basicStats));

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDetailsImplCopyWith<_$PokemonDetailsImpl> get copyWith =>
      __$$PokemonDetailsImplCopyWithImpl<_$PokemonDetailsImpl>(
          this, _$identity);
}

abstract class _PokemonDetails implements PokemonDetails {
  const factory _PokemonDetails(
      {required final Pokemon pokemon,
      required final List<BasicStat> basicStats}) = _$PokemonDetailsImpl;

  @override
  Pokemon get pokemon;
  @override
  List<BasicStat> get basicStats;

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDetailsImplCopyWith<_$PokemonDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
