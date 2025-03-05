// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BasicStat {
  int get value => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Create a copy of BasicStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasicStatCopyWith<BasicStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicStatCopyWith<$Res> {
  factory $BasicStatCopyWith(BasicStat value, $Res Function(BasicStat) then) =
      _$BasicStatCopyWithImpl<$Res, BasicStat>;
  @useResult
  $Res call({int value, String name});
}

/// @nodoc
class _$BasicStatCopyWithImpl<$Res, $Val extends BasicStat>
    implements $BasicStatCopyWith<$Res> {
  _$BasicStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasicStat
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
abstract class _$$BasicStatImplCopyWith<$Res>
    implements $BasicStatCopyWith<$Res> {
  factory _$$BasicStatImplCopyWith(
          _$BasicStatImpl value, $Res Function(_$BasicStatImpl) then) =
      __$$BasicStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, String name});
}

/// @nodoc
class __$$BasicStatImplCopyWithImpl<$Res>
    extends _$BasicStatCopyWithImpl<$Res, _$BasicStatImpl>
    implements _$$BasicStatImplCopyWith<$Res> {
  __$$BasicStatImplCopyWithImpl(
      _$BasicStatImpl _value, $Res Function(_$BasicStatImpl) _then)
      : super(_value, _then);

  /// Create a copy of BasicStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? name = null,
  }) {
    return _then(_$BasicStatImpl(
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

class _$BasicStatImpl implements _BasicStat {
  const _$BasicStatImpl({required this.value, required this.name});

  @override
  final int value;
  @override
  final String name;

  @override
  String toString() {
    return 'BasicStat(value: $value, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicStatImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, name);

  /// Create a copy of BasicStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicStatImplCopyWith<_$BasicStatImpl> get copyWith =>
      __$$BasicStatImplCopyWithImpl<_$BasicStatImpl>(this, _$identity);
}

abstract class _BasicStat implements BasicStat {
  const factory _BasicStat(
      {required final int value, required final String name}) = _$BasicStatImpl;

  @override
  int get value;
  @override
  String get name;

  /// Create a copy of BasicStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasicStatImplCopyWith<_$BasicStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
