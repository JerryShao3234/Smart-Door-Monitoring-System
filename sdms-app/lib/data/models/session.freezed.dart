// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Session {
  /// An empty User
  User get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, String? errorMessage) empty,
    required TResult Function(User user) authenticating,
    required TResult Function(User user) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, String? errorMessage)? empty,
    TResult? Function(User user)? authenticating,
    TResult? Function(User user)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, String? errorMessage)? empty,
    TResult Function(User user)? authenticating,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptySession value) empty,
    required TResult Function(AuthenticatingSession value) authenticating,
    required TResult Function(AuthenticatedSession value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptySession value)? empty,
    TResult? Function(AuthenticatingSession value)? authenticating,
    TResult? Function(AuthenticatedSession value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptySession value)? empty,
    TResult Function(AuthenticatingSession value)? authenticating,
    TResult Function(AuthenticatedSession value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmptySessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$EmptySessionCopyWith(
          _$EmptySession value, $Res Function(_$EmptySession) then) =
      __$$EmptySessionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, String? errorMessage});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$EmptySessionCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$EmptySession>
    implements _$$EmptySessionCopyWith<$Res> {
  __$$EmptySessionCopyWithImpl(
      _$EmptySession _value, $Res Function(_$EmptySession) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$EmptySession(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EmptySession extends EmptySession {
  const _$EmptySession({this.user = User.empty, this.errorMessage})
      : assert(user == User.empty, 'EmptySession User must be empty'),
        super._();

  /// An empty User
  @override
  @JsonKey()
  final User user;

  /// An error message on authorization fail, like no such email.
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'Session.empty(user: $user, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptySession &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptySessionCopyWith<_$EmptySession> get copyWith =>
      __$$EmptySessionCopyWithImpl<_$EmptySession>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, String? errorMessage) empty,
    required TResult Function(User user) authenticating,
    required TResult Function(User user) authenticated,
  }) {
    return empty(user, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, String? errorMessage)? empty,
    TResult? Function(User user)? authenticating,
    TResult? Function(User user)? authenticated,
  }) {
    return empty?.call(user, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, String? errorMessage)? empty,
    TResult Function(User user)? authenticating,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(user, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptySession value) empty,
    required TResult Function(AuthenticatingSession value) authenticating,
    required TResult Function(AuthenticatedSession value) authenticated,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptySession value)? empty,
    TResult? Function(AuthenticatingSession value)? authenticating,
    TResult? Function(AuthenticatedSession value)? authenticated,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptySession value)? empty,
    TResult Function(AuthenticatingSession value)? authenticating,
    TResult Function(AuthenticatedSession value)? authenticated,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptySession extends Session {
  const factory EmptySession({final User user, final String? errorMessage}) =
      _$EmptySession;
  const EmptySession._() : super._();

  @override

  /// An empty User
  User get user;

  /// An error message on authorization fail, like no such email.
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$EmptySessionCopyWith<_$EmptySession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatingSessionCopyWith<$Res>
    implements $SessionCopyWith<$Res> {
  factory _$$AuthenticatingSessionCopyWith(_$AuthenticatingSession value,
          $Res Function(_$AuthenticatingSession) then) =
      __$$AuthenticatingSessionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthenticatingSessionCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$AuthenticatingSession>
    implements _$$AuthenticatingSessionCopyWith<$Res> {
  __$$AuthenticatingSessionCopyWithImpl(_$AuthenticatingSession _value,
      $Res Function(_$AuthenticatingSession) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthenticatingSession(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$AuthenticatingSession extends AuthenticatingSession {
  const _$AuthenticatingSession({this.user = User.empty})
      : assert(user == User.empty, 'authenticating User must be empty'),
        super._();

  /// An empty User
  @override
  @JsonKey()
  final User user;

  @override
  String toString() {
    return 'Session.authenticating(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatingSession &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatingSessionCopyWith<_$AuthenticatingSession> get copyWith =>
      __$$AuthenticatingSessionCopyWithImpl<_$AuthenticatingSession>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, String? errorMessage) empty,
    required TResult Function(User user) authenticating,
    required TResult Function(User user) authenticated,
  }) {
    return authenticating(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, String? errorMessage)? empty,
    TResult? Function(User user)? authenticating,
    TResult? Function(User user)? authenticated,
  }) {
    return authenticating?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, String? errorMessage)? empty,
    TResult Function(User user)? authenticating,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptySession value) empty,
    required TResult Function(AuthenticatingSession value) authenticating,
    required TResult Function(AuthenticatedSession value) authenticated,
  }) {
    return authenticating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptySession value)? empty,
    TResult? Function(AuthenticatingSession value)? authenticating,
    TResult? Function(AuthenticatedSession value)? authenticated,
  }) {
    return authenticating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptySession value)? empty,
    TResult Function(AuthenticatingSession value)? authenticating,
    TResult Function(AuthenticatedSession value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(this);
    }
    return orElse();
  }
}

abstract class AuthenticatingSession extends Session {
  const factory AuthenticatingSession({final User user}) =
      _$AuthenticatingSession;
  const AuthenticatingSession._() : super._();

  @override

  /// An empty User
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$AuthenticatingSessionCopyWith<_$AuthenticatingSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatedSessionCopyWith<$Res>
    implements $SessionCopyWith<$Res> {
  factory _$$AuthenticatedSessionCopyWith(_$AuthenticatedSession value,
          $Res Function(_$AuthenticatedSession) then) =
      __$$AuthenticatedSessionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthenticatedSessionCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$AuthenticatedSession>
    implements _$$AuthenticatedSessionCopyWith<$Res> {
  __$$AuthenticatedSessionCopyWithImpl(_$AuthenticatedSession _value,
      $Res Function(_$AuthenticatedSession) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthenticatedSession(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$AuthenticatedSession extends AuthenticatedSession {
  const _$AuthenticatedSession({required this.user})
      : assert(user != User.empty, 'authenticated User must not be empty'),
        super._();

  /// User for this Session.
  @override
  final User user;

  @override
  String toString() {
    return 'Session.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedSession &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedSessionCopyWith<_$AuthenticatedSession> get copyWith =>
      __$$AuthenticatedSessionCopyWithImpl<_$AuthenticatedSession>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, String? errorMessage) empty,
    required TResult Function(User user) authenticating,
    required TResult Function(User user) authenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, String? errorMessage)? empty,
    TResult? Function(User user)? authenticating,
    TResult? Function(User user)? authenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, String? errorMessage)? empty,
    TResult Function(User user)? authenticating,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptySession value) empty,
    required TResult Function(AuthenticatingSession value) authenticating,
    required TResult Function(AuthenticatedSession value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptySession value)? empty,
    TResult? Function(AuthenticatingSession value)? authenticating,
    TResult? Function(AuthenticatedSession value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptySession value)? empty,
    TResult Function(AuthenticatingSession value)? authenticating,
    TResult Function(AuthenticatedSession value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticatedSession extends Session {
  const factory AuthenticatedSession({required final User user}) =
      _$AuthenticatedSession;
  const AuthenticatedSession._() : super._();

  @override

  /// User for this Session.
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$AuthenticatedSessionCopyWith<_$AuthenticatedSession> get copyWith =>
      throw _privateConstructorUsedError;
}
