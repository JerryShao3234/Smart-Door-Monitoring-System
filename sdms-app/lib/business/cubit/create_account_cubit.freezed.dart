// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateAccountState {
  /// The unique id of the SDMS that should be associated with this user
  String get sdmsId => throw _privateConstructorUsedError;

  /// The user's preferred name, probably just their first name
  String get name => throw _privateConstructorUsedError;

  /// The user's email address, validated by Flutter
  String get email => throw _privateConstructorUsedError;

  /// A minimum 8 character password
  String get password => throw _privateConstructorUsedError;

  /// The value of the Confirm Password text field, to ensure both are equal
  String get confirmPassword => throw _privateConstructorUsedError;

  /// The create account form status
  CreateAccountFormStatus get status => throw _privateConstructorUsedError;

  /// A form-wide error message, should the server have an issue
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateAccountStateCopyWith<CreateAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAccountStateCopyWith<$Res> {
  factory $CreateAccountStateCopyWith(
          CreateAccountState value, $Res Function(CreateAccountState) then) =
      _$CreateAccountStateCopyWithImpl<$Res, CreateAccountState>;
  @useResult
  $Res call(
      {String sdmsId,
      String name,
      String email,
      String password,
      String confirmPassword,
      CreateAccountFormStatus status,
      String? errorMessage});
}

/// @nodoc
class _$CreateAccountStateCopyWithImpl<$Res, $Val extends CreateAccountState>
    implements $CreateAccountStateCopyWith<$Res> {
  _$CreateAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sdmsId = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      sdmsId: null == sdmsId
          ? _value.sdmsId
          : sdmsId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateAccountFormStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateAccountStateCopyWith<$Res>
    implements $CreateAccountStateCopyWith<$Res> {
  factory _$$_CreateAccountStateCopyWith(_$_CreateAccountState value,
          $Res Function(_$_CreateAccountState) then) =
      __$$_CreateAccountStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sdmsId,
      String name,
      String email,
      String password,
      String confirmPassword,
      CreateAccountFormStatus status,
      String? errorMessage});
}

/// @nodoc
class __$$_CreateAccountStateCopyWithImpl<$Res>
    extends _$CreateAccountStateCopyWithImpl<$Res, _$_CreateAccountState>
    implements _$$_CreateAccountStateCopyWith<$Res> {
  __$$_CreateAccountStateCopyWithImpl(
      _$_CreateAccountState _value, $Res Function(_$_CreateAccountState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sdmsId = null,
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_CreateAccountState(
      sdmsId: null == sdmsId
          ? _value.sdmsId
          : sdmsId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CreateAccountFormStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CreateAccountState extends _CreateAccountState {
  const _$_CreateAccountState(
      {this.sdmsId = "",
      this.name = "",
      this.email = "",
      this.password = "",
      this.confirmPassword = "",
      this.status = CreateAccountFormStatus.initial,
      this.errorMessage})
      : super._();

  /// The unique id of the SDMS that should be associated with this user
  @override
  @JsonKey()
  final String sdmsId;

  /// The user's preferred name, probably just their first name
  @override
  @JsonKey()
  final String name;

  /// The user's email address, validated by Flutter
  @override
  @JsonKey()
  final String email;

  /// A minimum 8 character password
  @override
  @JsonKey()
  final String password;

  /// The value of the Confirm Password text field, to ensure both are equal
  @override
  @JsonKey()
  final String confirmPassword;

  /// The create account form status
  @override
  @JsonKey()
  final CreateAccountFormStatus status;

  /// A form-wide error message, should the server have an issue
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CreateAccountState(sdmsId: $sdmsId, name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateAccountState &&
            (identical(other.sdmsId, sdmsId) || other.sdmsId == sdmsId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sdmsId, name, email, password,
      confirmPassword, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateAccountStateCopyWith<_$_CreateAccountState> get copyWith =>
      __$$_CreateAccountStateCopyWithImpl<_$_CreateAccountState>(
          this, _$identity);
}

abstract class _CreateAccountState extends CreateAccountState {
  const factory _CreateAccountState(
      {final String sdmsId,
      final String name,
      final String email,
      final String password,
      final String confirmPassword,
      final CreateAccountFormStatus status,
      final String? errorMessage}) = _$_CreateAccountState;
  const _CreateAccountState._() : super._();

  @override

  /// The unique id of the SDMS that should be associated with this user
  String get sdmsId;
  @override

  /// The user's preferred name, probably just their first name
  String get name;
  @override

  /// The user's email address, validated by Flutter
  String get email;
  @override

  /// A minimum 8 character password
  String get password;
  @override

  /// The value of the Confirm Password text field, to ensure both are equal
  String get confirmPassword;
  @override

  /// The create account form status
  CreateAccountFormStatus get status;
  @override

  /// A form-wide error message, should the server have an issue
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CreateAccountStateCopyWith<_$_CreateAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
