// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_select_type_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonSelectTypeState {
  List<PokemonType> get pokemonTypes => throw _privateConstructorUsedError;
  PokemonType? get selectedPokemonType => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSelectTypeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSelectTypeStateCopyWith<PokemonSelectTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSelectTypeStateCopyWith<$Res> {
  factory $PokemonSelectTypeStateCopyWith(PokemonSelectTypeState value,
          $Res Function(PokemonSelectTypeState) then) =
      _$PokemonSelectTypeStateCopyWithImpl<$Res, PokemonSelectTypeState>;
  @useResult
  $Res call({List<PokemonType> pokemonTypes, PokemonType? selectedPokemonType});

  $PokemonTypeCopyWith<$Res>? get selectedPokemonType;
}

/// @nodoc
class _$PokemonSelectTypeStateCopyWithImpl<$Res,
        $Val extends PokemonSelectTypeState>
    implements $PokemonSelectTypeStateCopyWith<$Res> {
  _$PokemonSelectTypeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSelectTypeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonTypes = null,
    Object? selectedPokemonType = freezed,
  }) {
    return _then(_value.copyWith(
      pokemonTypes: null == pokemonTypes
          ? _value.pokemonTypes
          : pokemonTypes // ignore: cast_nullable_to_non_nullable
              as List<PokemonType>,
      selectedPokemonType: freezed == selectedPokemonType
          ? _value.selectedPokemonType
          : selectedPokemonType // ignore: cast_nullable_to_non_nullable
              as PokemonType?,
    ) as $Val);
  }

  /// Create a copy of PokemonSelectTypeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonTypeCopyWith<$Res>? get selectedPokemonType {
    if (_value.selectedPokemonType == null) {
      return null;
    }

    return $PokemonTypeCopyWith<$Res>(_value.selectedPokemonType!, (value) {
      return _then(_value.copyWith(selectedPokemonType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $PokemonSelectTypeStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PokemonType> pokemonTypes, PokemonType? selectedPokemonType});

  @override
  $PokemonTypeCopyWith<$Res>? get selectedPokemonType;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PokemonSelectTypeStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonSelectTypeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonTypes = null,
    Object? selectedPokemonType = freezed,
  }) {
    return _then(_$SuccessImpl(
      null == pokemonTypes
          ? _value._pokemonTypes
          : pokemonTypes // ignore: cast_nullable_to_non_nullable
              as List<PokemonType>,
      selectedPokemonType: freezed == selectedPokemonType
          ? _value.selectedPokemonType
          : selectedPokemonType // ignore: cast_nullable_to_non_nullable
              as PokemonType?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<PokemonType> pokemonTypes,
      {this.selectedPokemonType})
      : _pokemonTypes = pokemonTypes;

  final List<PokemonType> _pokemonTypes;
  @override
  List<PokemonType> get pokemonTypes {
    if (_pokemonTypes is EqualUnmodifiableListView) return _pokemonTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemonTypes);
  }

  @override
  final PokemonType? selectedPokemonType;

  @override
  String toString() {
    return 'PokemonSelectTypeState(pokemonTypes: $pokemonTypes, selectedPokemonType: $selectedPokemonType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._pokemonTypes, _pokemonTypes) &&
            (identical(other.selectedPokemonType, selectedPokemonType) ||
                other.selectedPokemonType == selectedPokemonType));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_pokemonTypes), selectedPokemonType);

  /// Create a copy of PokemonSelectTypeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);
}

abstract class _Success implements PokemonSelectTypeState {
  const factory _Success(final List<PokemonType> pokemonTypes,
      {final PokemonType? selectedPokemonType}) = _$SuccessImpl;

  @override
  List<PokemonType> get pokemonTypes;
  @override
  PokemonType? get selectedPokemonType;

  /// Create a copy of PokemonSelectTypeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
