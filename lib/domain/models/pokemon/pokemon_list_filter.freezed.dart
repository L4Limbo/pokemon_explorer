// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonListFilter {
  PokemonType? get pokemonType => throw _privateConstructorUsedError;
  String? get pokemonName => throw _privateConstructorUsedError;

  /// Create a copy of PokemonListFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonListFilterCopyWith<PokemonListFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListFilterCopyWith<$Res> {
  factory $PokemonListFilterCopyWith(
          PokemonListFilter value, $Res Function(PokemonListFilter) then) =
      _$PokemonListFilterCopyWithImpl<$Res, PokemonListFilter>;
  @useResult
  $Res call({PokemonType? pokemonType, String? pokemonName});

  $PokemonTypeCopyWith<$Res>? get pokemonType;
}

/// @nodoc
class _$PokemonListFilterCopyWithImpl<$Res, $Val extends PokemonListFilter>
    implements $PokemonListFilterCopyWith<$Res> {
  _$PokemonListFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonType = freezed,
    Object? pokemonName = freezed,
  }) {
    return _then(_value.copyWith(
      pokemonType: freezed == pokemonType
          ? _value.pokemonType
          : pokemonType // ignore: cast_nullable_to_non_nullable
              as PokemonType?,
      pokemonName: freezed == pokemonName
          ? _value.pokemonName
          : pokemonName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PokemonListFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonTypeCopyWith<$Res>? get pokemonType {
    if (_value.pokemonType == null) {
      return null;
    }

    return $PokemonTypeCopyWith<$Res>(_value.pokemonType!, (value) {
      return _then(_value.copyWith(pokemonType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonListFilterImplCopyWith<$Res>
    implements $PokemonListFilterCopyWith<$Res> {
  factory _$$PokemonListFilterImplCopyWith(_$PokemonListFilterImpl value,
          $Res Function(_$PokemonListFilterImpl) then) =
      __$$PokemonListFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PokemonType? pokemonType, String? pokemonName});

  @override
  $PokemonTypeCopyWith<$Res>? get pokemonType;
}

/// @nodoc
class __$$PokemonListFilterImplCopyWithImpl<$Res>
    extends _$PokemonListFilterCopyWithImpl<$Res, _$PokemonListFilterImpl>
    implements _$$PokemonListFilterImplCopyWith<$Res> {
  __$$PokemonListFilterImplCopyWithImpl(_$PokemonListFilterImpl _value,
      $Res Function(_$PokemonListFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonType = freezed,
    Object? pokemonName = freezed,
  }) {
    return _then(_$PokemonListFilterImpl(
      pokemonType: freezed == pokemonType
          ? _value.pokemonType
          : pokemonType // ignore: cast_nullable_to_non_nullable
              as PokemonType?,
      pokemonName: freezed == pokemonName
          ? _value.pokemonName
          : pokemonName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PokemonListFilterImpl implements _PokemonListFilter {
  const _$PokemonListFilterImpl({this.pokemonType, this.pokemonName});

  @override
  final PokemonType? pokemonType;
  @override
  final String? pokemonName;

  @override
  String toString() {
    return 'PokemonListFilter(pokemonType: $pokemonType, pokemonName: $pokemonName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListFilterImpl &&
            (identical(other.pokemonType, pokemonType) ||
                other.pokemonType == pokemonType) &&
            (identical(other.pokemonName, pokemonName) ||
                other.pokemonName == pokemonName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pokemonType, pokemonName);

  /// Create a copy of PokemonListFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListFilterImplCopyWith<_$PokemonListFilterImpl> get copyWith =>
      __$$PokemonListFilterImplCopyWithImpl<_$PokemonListFilterImpl>(
          this, _$identity);
}

abstract class _PokemonListFilter implements PokemonListFilter {
  const factory _PokemonListFilter(
      {final PokemonType? pokemonType,
      final String? pokemonName}) = _$PokemonListFilterImpl;

  @override
  PokemonType? get pokemonType;
  @override
  String? get pokemonName;

  /// Create a copy of PokemonListFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListFilterImplCopyWith<_$PokemonListFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
