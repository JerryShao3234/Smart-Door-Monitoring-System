// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateUserFailure {
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateUserFailureCopyWith<CreateUserFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserFailureCopyWith<$Res> {
  factory $CreateUserFailureCopyWith(
          CreateUserFailure value, $Res Function(CreateUserFailure) then) =
      _$CreateUserFailureCopyWithImpl<$Res, CreateUserFailure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CreateUserFailureCopyWithImpl<$Res, $Val extends CreateUserFailure>
    implements $CreateUserFailureCopyWith<$Res> {
  _$CreateUserFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateUserFailureCopyWith<$Res>
    implements $CreateUserFailureCopyWith<$Res> {
  factory _$$_CreateUserFailureCopyWith(_$_CreateUserFailure value,
          $Res Function(_$_CreateUserFailure) then) =
      __$$_CreateUserFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_CreateUserFailureCopyWithImpl<$Res>
    extends _$CreateUserFailureCopyWithImpl<$Res, _$_CreateUserFailure>
    implements _$$_CreateUserFailureCopyWith<$Res> {
  __$$_CreateUserFailureCopyWithImpl(
      _$_CreateUserFailure _value, $Res Function(_$_CreateUserFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_CreateUserFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateUserFailure implements _CreateUserFailure {
  const _$_CreateUserFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CreateUserFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateUserFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateUserFailureCopyWith<_$_CreateUserFailure> get copyWith =>
      __$$_CreateUserFailureCopyWithImpl<_$_CreateUserFailure>(
          this, _$identity);
}

abstract class _CreateUserFailure implements CreateUserFailure {
  const factory _CreateUserFailure(final String message) = _$_CreateUserFailure;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_CreateUserFailureCopyWith<_$_CreateUserFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
