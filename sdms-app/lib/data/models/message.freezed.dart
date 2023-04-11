// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  /// The unique id of this message
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;

  /// The user id of the user that this message is intended for
  @JsonKey(name: 'userID')
  String get userId => throw _privateConstructorUsedError;

  /// The body contents of the message
  @JsonKey(name: 'messageInfo')
  String? get body => throw _privateConstructorUsedError;

  /// The milliseconds since epoch at which this message was
  /// sent to the server from the SDMS.
  @JsonKey(name: 'date')
  int get receivedAt => throw _privateConstructorUsedError;

  /// The sender of this message.
  @JsonKey(name: 'sender')
  String? get sender => throw _privateConstructorUsedError;

  /// Whether this message has been marked as read by the user
  @JsonKey(name: 'read')
  bool get markedAsRead => throw _privateConstructorUsedError;

  /// The id of the visit that this message is related to.
  @JsonKey(name: 'visitID')
  String get visitId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'userID') String userId,
      @JsonKey(name: 'messageInfo') String? body,
      @JsonKey(name: 'date') int receivedAt,
      @JsonKey(name: 'sender') String? sender,
      @JsonKey(name: 'read') bool markedAsRead,
      @JsonKey(name: 'visitID') String visitId});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? body = freezed,
    Object? receivedAt = null,
    Object? sender = freezed,
    Object? markedAsRead = null,
    Object? visitId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as int,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      markedAsRead: null == markedAsRead
          ? _value.markedAsRead
          : markedAsRead // ignore: cast_nullable_to_non_nullable
              as bool,
      visitId: null == visitId
          ? _value.visitId
          : visitId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_MessageCopyWith(
          _$_Message value, $Res Function(_$_Message) then) =
      __$$_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'userID') String userId,
      @JsonKey(name: 'messageInfo') String? body,
      @JsonKey(name: 'date') int receivedAt,
      @JsonKey(name: 'sender') String? sender,
      @JsonKey(name: 'read') bool markedAsRead,
      @JsonKey(name: 'visitID') String visitId});
}

/// @nodoc
class __$$_MessageCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_Message>
    implements _$$_MessageCopyWith<$Res> {
  __$$_MessageCopyWithImpl(_$_Message _value, $Res Function(_$_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? body = freezed,
    Object? receivedAt = null,
    Object? sender = freezed,
    Object? markedAsRead = null,
    Object? visitId = null,
  }) {
    return _then(_$_Message(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as int,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      markedAsRead: null == markedAsRead
          ? _value.markedAsRead
          : markedAsRead // ignore: cast_nullable_to_non_nullable
              as bool,
      visitId: null == visitId
          ? _value.visitId
          : visitId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message extends _Message {
  const _$_Message(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'userID') required this.userId,
      @JsonKey(name: 'messageInfo') this.body,
      @JsonKey(name: 'date') required this.receivedAt,
      @JsonKey(name: 'sender') this.sender,
      @JsonKey(name: 'read') required this.markedAsRead,
      @JsonKey(name: 'visitID') required this.visitId})
      : super._();

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  /// The unique id of this message
  @override
  @JsonKey(name: '_id')
  final String id;

  /// The user id of the user that this message is intended for
  @override
  @JsonKey(name: 'userID')
  final String userId;

  /// The body contents of the message
  @override
  @JsonKey(name: 'messageInfo')
  final String? body;

  /// The milliseconds since epoch at which this message was
  /// sent to the server from the SDMS.
  @override
  @JsonKey(name: 'date')
  final int receivedAt;

  /// The sender of this message.
  @override
  @JsonKey(name: 'sender')
  final String? sender;

  /// Whether this message has been marked as read by the user
  @override
  @JsonKey(name: 'read')
  final bool markedAsRead;

  /// The id of the visit that this message is related to.
  @override
  @JsonKey(name: 'visitID')
  final String visitId;

  @override
  String toString() {
    return 'Message(id: $id, userId: $userId, body: $body, receivedAt: $receivedAt, sender: $sender, markedAsRead: $markedAsRead, visitId: $visitId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Message &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.markedAsRead, markedAsRead) ||
                other.markedAsRead == markedAsRead) &&
            (identical(other.visitId, visitId) || other.visitId == visitId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, body, receivedAt, sender, markedAsRead, visitId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      __$$_MessageCopyWithImpl<_$_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(
      this,
    );
  }
}

abstract class _Message extends Message {
  const factory _Message(
      {@JsonKey(name: '_id') required final String id,
      @JsonKey(name: 'userID') required final String userId,
      @JsonKey(name: 'messageInfo') final String? body,
      @JsonKey(name: 'date') required final int receivedAt,
      @JsonKey(name: 'sender') final String? sender,
      @JsonKey(name: 'read') required final bool markedAsRead,
      @JsonKey(name: 'visitID') required final String visitId}) = _$_Message;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override

  /// The unique id of this message
  @JsonKey(name: '_id')
  String get id;
  @override

  /// The user id of the user that this message is intended for
  @JsonKey(name: 'userID')
  String get userId;
  @override

  /// The body contents of the message
  @JsonKey(name: 'messageInfo')
  String? get body;
  @override

  /// The milliseconds since epoch at which this message was
  /// sent to the server from the SDMS.
  @JsonKey(name: 'date')
  int get receivedAt;
  @override

  /// The sender of this message.
  @JsonKey(name: 'sender')
  String? get sender;
  @override

  /// Whether this message has been marked as read by the user
  @JsonKey(name: 'read')
  bool get markedAsRead;
  @override

  /// The id of the visit that this message is related to.
  @JsonKey(name: 'visitID')
  String get visitId;
  @override
  @JsonKey(ignore: true)
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
