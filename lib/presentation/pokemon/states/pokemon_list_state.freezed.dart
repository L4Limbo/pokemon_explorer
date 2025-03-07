// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonListState {
  PagingController<int, Pokemon> get pagingController =>
      throw _privateConstructorUsedError;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonListStateCopyWith<PokemonListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListStateCopyWith<$Res> {
  factory $PokemonListStateCopyWith(
          PokemonListState value, $Res Function(PokemonListState) then) =
      _$PokemonListStateCopyWithImpl<$Res, PokemonListState>;
  @useResult
  $Res call({PagingController<int, Pokemon> pagingController});
}

/// @nodoc
class _$PokemonListStateCopyWithImpl<$Res, $Val extends PokemonListState>
    implements $PokemonListStateCopyWith<$Res> {
  _$PokemonListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingController = null,
  }) {
    return _then(_value.copyWith(
      pagingController: null == pagingController
          ? _value.pagingController
          : pagingController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, Pokemon>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemListStateImplCopyWith<$Res>
    implements $PokemonListStateCopyWith<$Res> {
  factory _$$ItemListStateImplCopyWith(
          _$ItemListStateImpl value, $Res Function(_$ItemListStateImpl) then) =
      __$$ItemListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PagingController<int, Pokemon> pagingController});
}

/// @nodoc
class __$$ItemListStateImplCopyWithImpl<$Res>
    extends _$PokemonListStateCopyWithImpl<$Res, _$ItemListStateImpl>
    implements _$$ItemListStateImplCopyWith<$Res> {
  __$$ItemListStateImplCopyWithImpl(
      _$ItemListStateImpl _value, $Res Function(_$ItemListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingController = null,
  }) {
    return _then(_$ItemListStateImpl(
      pagingController: null == pagingController
          ? _value.pagingController
          : pagingController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, Pokemon>,
    ));
  }
}

/// @nodoc

class _$ItemListStateImpl implements _ItemListState {
  const _$ItemListStateImpl({required this.pagingController});

  @override
  final PagingController<int, Pokemon> pagingController;

  @override
  String toString() {
    return 'PokemonListState(pagingController: $pagingController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemListStateImpl &&
            (identical(other.pagingController, pagingController) ||
                other.pagingController == pagingController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pagingController);

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemListStateImplCopyWith<_$ItemListStateImpl> get copyWith =>
      __$$ItemListStateImplCopyWithImpl<_$ItemListStateImpl>(this, _$identity);
}

abstract class _ItemListState implements PokemonListState {
  const factory _ItemListState(
          {required final PagingController<int, Pokemon> pagingController}) =
      _$ItemListStateImpl;

  @override
  PagingController<int, Pokemon> get pagingController;

  /// Create a copy of PokemonListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemListStateImplCopyWith<_$ItemListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
