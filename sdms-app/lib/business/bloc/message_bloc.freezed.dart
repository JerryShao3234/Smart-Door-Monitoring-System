// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function(String id) viewMessage,
    required TResult Function(String messageId) markReadUnread,
    required TResult Function(String? replyText) updateReply,
    required TResult Function(String? messageInfo) sendReply,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function(String id)? viewMessage,
    TResult? Function(String messageId)? markReadUnread,
    TResult? Function(String? replyText)? updateReply,
    TResult? Function(String? messageInfo)? sendReply,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function(String id)? viewMessage,
    TResult Function(String messageId)? markReadUnread,
    TResult Function(String? replyText)? updateReply,
    TResult Function(String? messageInfo)? sendReply,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageGetAll value) getAll,
    required TResult Function(MessageViewMessage value) viewMessage,
    required TResult Function(MessageMarkReadUnread value) markReadUnread,
    required TResult Function(MessageUpdateReply value) updateReply,
    required TResult Function(MessageSendReply value) sendReply,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageGetAll value)? getAll,
    TResult? Function(MessageViewMessage value)? viewMessage,
    TResult? Function(MessageMarkReadUnread value)? markReadUnread,
    TResult? Function(MessageUpdateReply value)? updateReply,
    TResult? Function(MessageSendReply value)? sendReply,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageGetAll value)? getAll,
    TResult Function(MessageViewMessage value)? viewMessage,
    TResult Function(MessageMarkReadUnread value)? markReadUnread,
    TResult Function(MessageUpdateReply value)? updateReply,
    TResult Function(MessageSendReply value)? sendReply,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageEventCopyWith<$Res> {
  factory $MessageEventCopyWith(
          MessageEvent value, $Res Function(MessageEvent) then) =
      _$MessageEventCopyWithImpl<$Res, MessageEvent>;
}

/// @nodoc
class _$MessageEventCopyWithImpl<$Res, $Val extends MessageEvent>
    implements $MessageEventCopyWith<$Res> {
  _$MessageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MessageGetAllCopyWith<$Res> {
  factory _$$MessageGetAllCopyWith(
          _$MessageGetAll value, $Res Function(_$MessageGetAll) then) =
      __$$MessageGetAllCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MessageGetAllCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res, _$MessageGetAll>
    implements _$$MessageGetAllCopyWith<$Res> {
  __$$MessageGetAllCopyWithImpl(
      _$MessageGetAll _value, $Res Function(_$MessageGetAll) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MessageGetAll with DiagnosticableTreeMixin implements MessageGetAll {
  const _$MessageGetAll();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageEvent.getAll()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MessageEvent.getAll'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MessageGetAll);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function(String id) viewMessage,
    required TResult Function(String messageId) markReadUnread,
    required TResult Function(String? replyText) updateReply,
    required TResult Function(String? messageInfo) sendReply,
  }) {
    return getAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function(String id)? viewMessage,
    TResult? Function(String messageId)? markReadUnread,
    TResult? Function(String? replyText)? updateReply,
    TResult? Function(String? messageInfo)? sendReply,
  }) {
    return getAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function(String id)? viewMessage,
    TResult Function(String messageId)? markReadUnread,
    TResult Function(String? replyText)? updateReply,
    TResult Function(String? messageInfo)? sendReply,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageGetAll value) getAll,
    required TResult Function(MessageViewMessage value) viewMessage,
    required TResult Function(MessageMarkReadUnread value) markReadUnread,
    required TResult Function(MessageUpdateReply value) updateReply,
    required TResult Function(MessageSendReply value) sendReply,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageGetAll value)? getAll,
    TResult? Function(MessageViewMessage value)? viewMessage,
    TResult? Function(MessageMarkReadUnread value)? markReadUnread,
    TResult? Function(MessageUpdateReply value)? updateReply,
    TResult? Function(MessageSendReply value)? sendReply,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageGetAll value)? getAll,
    TResult Function(MessageViewMessage value)? viewMessage,
    TResult Function(MessageMarkReadUnread value)? markReadUnread,
    TResult Function(MessageUpdateReply value)? updateReply,
    TResult Function(MessageSendReply value)? sendReply,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class MessageGetAll implements MessageEvent {
  const factory MessageGetAll() = _$MessageGetAll;
}

/// @nodoc
abstract class _$$MessageViewMessageCopyWith<$Res> {
  factory _$$MessageViewMessageCopyWith(_$MessageViewMessage value,
          $Res Function(_$MessageViewMessage) then) =
      __$$MessageViewMessageCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MessageViewMessageCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res, _$MessageViewMessage>
    implements _$$MessageViewMessageCopyWith<$Res> {
  __$$MessageViewMessageCopyWithImpl(
      _$MessageViewMessage _value, $Res Function(_$MessageViewMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MessageViewMessage(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MessageViewMessage
    with DiagnosticableTreeMixin
    implements MessageViewMessage {
  const _$MessageViewMessage({required this.id});

  /// The id of the current message displayed
  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageEvent.viewMessage(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageEvent.viewMessage'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageViewMessage &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageViewMessageCopyWith<_$MessageViewMessage> get copyWith =>
      __$$MessageViewMessageCopyWithImpl<_$MessageViewMessage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function(String id) viewMessage,
    required TResult Function(String messageId) markReadUnread,
    required TResult Function(String? replyText) updateReply,
    required TResult Function(String? messageInfo) sendReply,
  }) {
    return viewMessage(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function(String id)? viewMessage,
    TResult? Function(String messageId)? markReadUnread,
    TResult? Function(String? replyText)? updateReply,
    TResult? Function(String? messageInfo)? sendReply,
  }) {
    return viewMessage?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function(String id)? viewMessage,
    TResult Function(String messageId)? markReadUnread,
    TResult Function(String? replyText)? updateReply,
    TResult Function(String? messageInfo)? sendReply,
    required TResult orElse(),
  }) {
    if (viewMessage != null) {
      return viewMessage(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageGetAll value) getAll,
    required TResult Function(MessageViewMessage value) viewMessage,
    required TResult Function(MessageMarkReadUnread value) markReadUnread,
    required TResult Function(MessageUpdateReply value) updateReply,
    required TResult Function(MessageSendReply value) sendReply,
  }) {
    return viewMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageGetAll value)? getAll,
    TResult? Function(MessageViewMessage value)? viewMessage,
    TResult? Function(MessageMarkReadUnread value)? markReadUnread,
    TResult? Function(MessageUpdateReply value)? updateReply,
    TResult? Function(MessageSendReply value)? sendReply,
  }) {
    return viewMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageGetAll value)? getAll,
    TResult Function(MessageViewMessage value)? viewMessage,
    TResult Function(MessageMarkReadUnread value)? markReadUnread,
    TResult Function(MessageUpdateReply value)? updateReply,
    TResult Function(MessageSendReply value)? sendReply,
    required TResult orElse(),
  }) {
    if (viewMessage != null) {
      return viewMessage(this);
    }
    return orElse();
  }
}

abstract class MessageViewMessage implements MessageEvent {
  const factory MessageViewMessage({required final String id}) =
      _$MessageViewMessage;

  /// The id of the current message displayed
  String get id;
  @JsonKey(ignore: true)
  _$$MessageViewMessageCopyWith<_$MessageViewMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageMarkReadUnreadCopyWith<$Res> {
  factory _$$MessageMarkReadUnreadCopyWith(_$MessageMarkReadUnread value,
          $Res Function(_$MessageMarkReadUnread) then) =
      __$$MessageMarkReadUnreadCopyWithImpl<$Res>;
  @useResult
  $Res call({String messageId});
}

/// @nodoc
class __$$MessageMarkReadUnreadCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res, _$MessageMarkReadUnread>
    implements _$$MessageMarkReadUnreadCopyWith<$Res> {
  __$$MessageMarkReadUnreadCopyWithImpl(_$MessageMarkReadUnread _value,
      $Res Function(_$MessageMarkReadUnread) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
  }) {
    return _then(_$MessageMarkReadUnread(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MessageMarkReadUnread
    with DiagnosticableTreeMixin
    implements MessageMarkReadUnread {
  const _$MessageMarkReadUnread({required this.messageId});

  /// The id of the message in question
  @override
  final String messageId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageEvent.markReadUnread(messageId: $messageId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageEvent.markReadUnread'))
      ..add(DiagnosticsProperty('messageId', messageId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageMarkReadUnread &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageMarkReadUnreadCopyWith<_$MessageMarkReadUnread> get copyWith =>
      __$$MessageMarkReadUnreadCopyWithImpl<_$MessageMarkReadUnread>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function(String id) viewMessage,
    required TResult Function(String messageId) markReadUnread,
    required TResult Function(String? replyText) updateReply,
    required TResult Function(String? messageInfo) sendReply,
  }) {
    return markReadUnread(messageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function(String id)? viewMessage,
    TResult? Function(String messageId)? markReadUnread,
    TResult? Function(String? replyText)? updateReply,
    TResult? Function(String? messageInfo)? sendReply,
  }) {
    return markReadUnread?.call(messageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function(String id)? viewMessage,
    TResult Function(String messageId)? markReadUnread,
    TResult Function(String? replyText)? updateReply,
    TResult Function(String? messageInfo)? sendReply,
    required TResult orElse(),
  }) {
    if (markReadUnread != null) {
      return markReadUnread(messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageGetAll value) getAll,
    required TResult Function(MessageViewMessage value) viewMessage,
    required TResult Function(MessageMarkReadUnread value) markReadUnread,
    required TResult Function(MessageUpdateReply value) updateReply,
    required TResult Function(MessageSendReply value) sendReply,
  }) {
    return markReadUnread(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageGetAll value)? getAll,
    TResult? Function(MessageViewMessage value)? viewMessage,
    TResult? Function(MessageMarkReadUnread value)? markReadUnread,
    TResult? Function(MessageUpdateReply value)? updateReply,
    TResult? Function(MessageSendReply value)? sendReply,
  }) {
    return markReadUnread?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageGetAll value)? getAll,
    TResult Function(MessageViewMessage value)? viewMessage,
    TResult Function(MessageMarkReadUnread value)? markReadUnread,
    TResult Function(MessageUpdateReply value)? updateReply,
    TResult Function(MessageSendReply value)? sendReply,
    required TResult orElse(),
  }) {
    if (markReadUnread != null) {
      return markReadUnread(this);
    }
    return orElse();
  }
}

abstract class MessageMarkReadUnread implements MessageEvent {
  const factory MessageMarkReadUnread({required final String messageId}) =
      _$MessageMarkReadUnread;

  /// The id of the message in question
  String get messageId;
  @JsonKey(ignore: true)
  _$$MessageMarkReadUnreadCopyWith<_$MessageMarkReadUnread> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageUpdateReplyCopyWith<$Res> {
  factory _$$MessageUpdateReplyCopyWith(_$MessageUpdateReply value,
          $Res Function(_$MessageUpdateReply) then) =
      __$$MessageUpdateReplyCopyWithImpl<$Res>;
  @useResult
  $Res call({String? replyText});
}

/// @nodoc
class __$$MessageUpdateReplyCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res, _$MessageUpdateReply>
    implements _$$MessageUpdateReplyCopyWith<$Res> {
  __$$MessageUpdateReplyCopyWithImpl(
      _$MessageUpdateReply _value, $Res Function(_$MessageUpdateReply) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? replyText = freezed,
  }) {
    return _then(_$MessageUpdateReply(
      replyText: freezed == replyText
          ? _value.replyText
          : replyText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MessageUpdateReply
    with DiagnosticableTreeMixin
    implements MessageUpdateReply {
  const _$MessageUpdateReply({required this.replyText});

  /// The current text that the user is typing so far for the reply
  @override
  final String? replyText;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageEvent.updateReply(replyText: $replyText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageEvent.updateReply'))
      ..add(DiagnosticsProperty('replyText', replyText));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageUpdateReply &&
            (identical(other.replyText, replyText) ||
                other.replyText == replyText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, replyText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageUpdateReplyCopyWith<_$MessageUpdateReply> get copyWith =>
      __$$MessageUpdateReplyCopyWithImpl<_$MessageUpdateReply>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function(String id) viewMessage,
    required TResult Function(String messageId) markReadUnread,
    required TResult Function(String? replyText) updateReply,
    required TResult Function(String? messageInfo) sendReply,
  }) {
    return updateReply(replyText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function(String id)? viewMessage,
    TResult? Function(String messageId)? markReadUnread,
    TResult? Function(String? replyText)? updateReply,
    TResult? Function(String? messageInfo)? sendReply,
  }) {
    return updateReply?.call(replyText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function(String id)? viewMessage,
    TResult Function(String messageId)? markReadUnread,
    TResult Function(String? replyText)? updateReply,
    TResult Function(String? messageInfo)? sendReply,
    required TResult orElse(),
  }) {
    if (updateReply != null) {
      return updateReply(replyText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageGetAll value) getAll,
    required TResult Function(MessageViewMessage value) viewMessage,
    required TResult Function(MessageMarkReadUnread value) markReadUnread,
    required TResult Function(MessageUpdateReply value) updateReply,
    required TResult Function(MessageSendReply value) sendReply,
  }) {
    return updateReply(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageGetAll value)? getAll,
    TResult? Function(MessageViewMessage value)? viewMessage,
    TResult? Function(MessageMarkReadUnread value)? markReadUnread,
    TResult? Function(MessageUpdateReply value)? updateReply,
    TResult? Function(MessageSendReply value)? sendReply,
  }) {
    return updateReply?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageGetAll value)? getAll,
    TResult Function(MessageViewMessage value)? viewMessage,
    TResult Function(MessageMarkReadUnread value)? markReadUnread,
    TResult Function(MessageUpdateReply value)? updateReply,
    TResult Function(MessageSendReply value)? sendReply,
    required TResult orElse(),
  }) {
    if (updateReply != null) {
      return updateReply(this);
    }
    return orElse();
  }
}

abstract class MessageUpdateReply implements MessageEvent {
  const factory MessageUpdateReply({required final String? replyText}) =
      _$MessageUpdateReply;

  /// The current text that the user is typing so far for the reply
  String? get replyText;
  @JsonKey(ignore: true)
  _$$MessageUpdateReplyCopyWith<_$MessageUpdateReply> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageSendReplyCopyWith<$Res> {
  factory _$$MessageSendReplyCopyWith(
          _$MessageSendReply value, $Res Function(_$MessageSendReply) then) =
      __$$MessageSendReplyCopyWithImpl<$Res>;
  @useResult
  $Res call({String? messageInfo});
}

/// @nodoc
class __$$MessageSendReplyCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res, _$MessageSendReply>
    implements _$$MessageSendReplyCopyWith<$Res> {
  __$$MessageSendReplyCopyWithImpl(
      _$MessageSendReply _value, $Res Function(_$MessageSendReply) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageInfo = freezed,
  }) {
    return _then(_$MessageSendReply(
      messageInfo: freezed == messageInfo
          ? _value.messageInfo
          : messageInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MessageSendReply
    with DiagnosticableTreeMixin
    implements MessageSendReply {
  const _$MessageSendReply({required this.messageInfo});

  /// The body of the message to be sent to the SDMS
  @override
  final String? messageInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageEvent.sendReply(messageInfo: $messageInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageEvent.sendReply'))
      ..add(DiagnosticsProperty('messageInfo', messageInfo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageSendReply &&
            (identical(other.messageInfo, messageInfo) ||
                other.messageInfo == messageInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageSendReplyCopyWith<_$MessageSendReply> get copyWith =>
      __$$MessageSendReplyCopyWithImpl<_$MessageSendReply>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function(String id) viewMessage,
    required TResult Function(String messageId) markReadUnread,
    required TResult Function(String? replyText) updateReply,
    required TResult Function(String? messageInfo) sendReply,
  }) {
    return sendReply(messageInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function(String id)? viewMessage,
    TResult? Function(String messageId)? markReadUnread,
    TResult? Function(String? replyText)? updateReply,
    TResult? Function(String? messageInfo)? sendReply,
  }) {
    return sendReply?.call(messageInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function(String id)? viewMessage,
    TResult Function(String messageId)? markReadUnread,
    TResult Function(String? replyText)? updateReply,
    TResult Function(String? messageInfo)? sendReply,
    required TResult orElse(),
  }) {
    if (sendReply != null) {
      return sendReply(messageInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessageGetAll value) getAll,
    required TResult Function(MessageViewMessage value) viewMessage,
    required TResult Function(MessageMarkReadUnread value) markReadUnread,
    required TResult Function(MessageUpdateReply value) updateReply,
    required TResult Function(MessageSendReply value) sendReply,
  }) {
    return sendReply(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessageGetAll value)? getAll,
    TResult? Function(MessageViewMessage value)? viewMessage,
    TResult? Function(MessageMarkReadUnread value)? markReadUnread,
    TResult? Function(MessageUpdateReply value)? updateReply,
    TResult? Function(MessageSendReply value)? sendReply,
  }) {
    return sendReply?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessageGetAll value)? getAll,
    TResult Function(MessageViewMessage value)? viewMessage,
    TResult Function(MessageMarkReadUnread value)? markReadUnread,
    TResult Function(MessageUpdateReply value)? updateReply,
    TResult Function(MessageSendReply value)? sendReply,
    required TResult orElse(),
  }) {
    if (sendReply != null) {
      return sendReply(this);
    }
    return orElse();
  }
}

abstract class MessageSendReply implements MessageEvent {
  const factory MessageSendReply({required final String? messageInfo}) =
      _$MessageSendReply;

  /// The body of the message to be sent to the SDMS
  String? get messageInfo;
  @JsonKey(ignore: true)
  _$$MessageSendReplyCopyWith<_$MessageSendReply> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MessageState {
  /// The current user associated with this session.
  User get user => throw _privateConstructorUsedError;

  /// The user's list of all visits.
  List<Visit> get visits => throw _privateConstructorUsedError;

  /// The user's list of all messages stored on the server.
  List<Message> get messages => throw _privateConstructorUsedError;

  /// Contains the messages from [messages] that are marked as unread.
  List<Message> get unreadMessages => throw _privateConstructorUsedError;

  /// The error message preventing Message operations from succeeding.
  String? get error => throw _privateConstructorUsedError;

  /// The current message the user is interacting with.
  Message? get currentMessage => throw _privateConstructorUsedError;

  /// The [Visit] that is associated with [currentMessage]
  Visit? get currentVisit => throw _privateConstructorUsedError;

  /// The index that [currentMessage] is located in [messages].
  int get currentIndex => throw _privateConstructorUsedError;

  /// The state of the user sending a message
  ReplyStatus get replyStatus => throw _privateConstructorUsedError;

  /// The state of the bloc fetching messages
  LoadingStatus get messageStatus => throw _privateConstructorUsedError;

  /// The reply written by the user so far as a response to [currentMessage].
  ///
  /// Will have a length less than or equal to 200 characters.
  String? get reply => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageStateCopyWith<MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStateCopyWith<$Res> {
  factory $MessageStateCopyWith(
          MessageState value, $Res Function(MessageState) then) =
      _$MessageStateCopyWithImpl<$Res, MessageState>;
  @useResult
  $Res call(
      {User user,
      List<Visit> visits,
      List<Message> messages,
      List<Message> unreadMessages,
      String? error,
      Message? currentMessage,
      Visit? currentVisit,
      int currentIndex,
      ReplyStatus replyStatus,
      LoadingStatus messageStatus,
      String? reply});

  $UserCopyWith<$Res> get user;
  $MessageCopyWith<$Res>? get currentMessage;
  $VisitCopyWith<$Res>? get currentVisit;
}

/// @nodoc
class _$MessageStateCopyWithImpl<$Res, $Val extends MessageState>
    implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? visits = null,
    Object? messages = null,
    Object? unreadMessages = null,
    Object? error = freezed,
    Object? currentMessage = freezed,
    Object? currentVisit = freezed,
    Object? currentIndex = null,
    Object? replyStatus = null,
    Object? messageStatus = null,
    Object? reply = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      visits: null == visits
          ? _value.visits
          : visits // ignore: cast_nullable_to_non_nullable
              as List<Visit>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      unreadMessages: null == unreadMessages
          ? _value.unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      currentMessage: freezed == currentMessage
          ? _value.currentMessage
          : currentMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
      currentVisit: freezed == currentVisit
          ? _value.currentVisit
          : currentVisit // ignore: cast_nullable_to_non_nullable
              as Visit?,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      replyStatus: null == replyStatus
          ? _value.replyStatus
          : replyStatus // ignore: cast_nullable_to_non_nullable
              as ReplyStatus,
      messageStatus: null == messageStatus
          ? _value.messageStatus
          : messageStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res>? get currentMessage {
    if (_value.currentMessage == null) {
      return null;
    }

    return $MessageCopyWith<$Res>(_value.currentMessage!, (value) {
      return _then(_value.copyWith(currentMessage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VisitCopyWith<$Res>? get currentVisit {
    if (_value.currentVisit == null) {
      return null;
    }

    return $VisitCopyWith<$Res>(_value.currentVisit!, (value) {
      return _then(_value.copyWith(currentVisit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MessageStateCopyWith<$Res>
    implements $MessageStateCopyWith<$Res> {
  factory _$$_MessageStateCopyWith(
          _$_MessageState value, $Res Function(_$_MessageState) then) =
      __$$_MessageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      List<Visit> visits,
      List<Message> messages,
      List<Message> unreadMessages,
      String? error,
      Message? currentMessage,
      Visit? currentVisit,
      int currentIndex,
      ReplyStatus replyStatus,
      LoadingStatus messageStatus,
      String? reply});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $MessageCopyWith<$Res>? get currentMessage;
  @override
  $VisitCopyWith<$Res>? get currentVisit;
}

/// @nodoc
class __$$_MessageStateCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res, _$_MessageState>
    implements _$$_MessageStateCopyWith<$Res> {
  __$$_MessageStateCopyWithImpl(
      _$_MessageState _value, $Res Function(_$_MessageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? visits = null,
    Object? messages = null,
    Object? unreadMessages = null,
    Object? error = freezed,
    Object? currentMessage = freezed,
    Object? currentVisit = freezed,
    Object? currentIndex = null,
    Object? replyStatus = null,
    Object? messageStatus = null,
    Object? reply = freezed,
  }) {
    return _then(_$_MessageState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      visits: null == visits
          ? _value._visits
          : visits // ignore: cast_nullable_to_non_nullable
              as List<Visit>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      unreadMessages: null == unreadMessages
          ? _value._unreadMessages
          : unreadMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      currentMessage: freezed == currentMessage
          ? _value.currentMessage
          : currentMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
      currentVisit: freezed == currentVisit
          ? _value.currentVisit
          : currentVisit // ignore: cast_nullable_to_non_nullable
              as Visit?,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      replyStatus: null == replyStatus
          ? _value.replyStatus
          : replyStatus // ignore: cast_nullable_to_non_nullable
              as ReplyStatus,
      messageStatus: null == messageStatus
          ? _value.messageStatus
          : messageStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MessageState with DiagnosticableTreeMixin implements _MessageState {
  const _$_MessageState(
      {required this.user,
      final List<Visit> visits = const [],
      final List<Message> messages = const [],
      final List<Message> unreadMessages = const [],
      this.error,
      this.currentMessage,
      this.currentVisit,
      this.currentIndex = 0,
      this.replyStatus = ReplyStatus.initial,
      this.messageStatus = LoadingStatus.loading,
      this.reply})
      : _visits = visits,
        _messages = messages,
        _unreadMessages = unreadMessages;

  /// The current user associated with this session.
  @override
  final User user;

  /// The user's list of all visits.
  final List<Visit> _visits;

  /// The user's list of all visits.
  @override
  @JsonKey()
  List<Visit> get visits {
    if (_visits is EqualUnmodifiableListView) return _visits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visits);
  }

  /// The user's list of all messages stored on the server.
  final List<Message> _messages;

  /// The user's list of all messages stored on the server.
  @override
  @JsonKey()
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// Contains the messages from [messages] that are marked as unread.
  final List<Message> _unreadMessages;

  /// Contains the messages from [messages] that are marked as unread.
  @override
  @JsonKey()
  List<Message> get unreadMessages {
    if (_unreadMessages is EqualUnmodifiableListView) return _unreadMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unreadMessages);
  }

  /// The error message preventing Message operations from succeeding.
  @override
  final String? error;

  /// The current message the user is interacting with.
  @override
  final Message? currentMessage;

  /// The [Visit] that is associated with [currentMessage]
  @override
  final Visit? currentVisit;

  /// The index that [currentMessage] is located in [messages].
  @override
  @JsonKey()
  final int currentIndex;

  /// The state of the user sending a message
  @override
  @JsonKey()
  final ReplyStatus replyStatus;

  /// The state of the bloc fetching messages
  @override
  @JsonKey()
  final LoadingStatus messageStatus;

  /// The reply written by the user so far as a response to [currentMessage].
  ///
  /// Will have a length less than or equal to 200 characters.
  @override
  final String? reply;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageState(user: $user, visits: $visits, messages: $messages, unreadMessages: $unreadMessages, error: $error, currentMessage: $currentMessage, currentVisit: $currentVisit, currentIndex: $currentIndex, replyStatus: $replyStatus, messageStatus: $messageStatus, reply: $reply)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageState'))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('visits', visits))
      ..add(DiagnosticsProperty('messages', messages))
      ..add(DiagnosticsProperty('unreadMessages', unreadMessages))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('currentMessage', currentMessage))
      ..add(DiagnosticsProperty('currentVisit', currentVisit))
      ..add(DiagnosticsProperty('currentIndex', currentIndex))
      ..add(DiagnosticsProperty('replyStatus', replyStatus))
      ..add(DiagnosticsProperty('messageStatus', messageStatus))
      ..add(DiagnosticsProperty('reply', reply));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageState &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._visits, _visits) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality()
                .equals(other._unreadMessages, _unreadMessages) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.currentMessage, currentMessage) ||
                other.currentMessage == currentMessage) &&
            (identical(other.currentVisit, currentVisit) ||
                other.currentVisit == currentVisit) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.replyStatus, replyStatus) ||
                other.replyStatus == replyStatus) &&
            (identical(other.messageStatus, messageStatus) ||
                other.messageStatus == messageStatus) &&
            (identical(other.reply, reply) || other.reply == reply));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      const DeepCollectionEquality().hash(_visits),
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(_unreadMessages),
      error,
      currentMessage,
      currentVisit,
      currentIndex,
      replyStatus,
      messageStatus,
      reply);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageStateCopyWith<_$_MessageState> get copyWith =>
      __$$_MessageStateCopyWithImpl<_$_MessageState>(this, _$identity);
}

abstract class _MessageState implements MessageState {
  const factory _MessageState(
      {required final User user,
      final List<Visit> visits,
      final List<Message> messages,
      final List<Message> unreadMessages,
      final String? error,
      final Message? currentMessage,
      final Visit? currentVisit,
      final int currentIndex,
      final ReplyStatus replyStatus,
      final LoadingStatus messageStatus,
      final String? reply}) = _$_MessageState;

  @override

  /// The current user associated with this session.
  User get user;
  @override

  /// The user's list of all visits.
  List<Visit> get visits;
  @override

  /// The user's list of all messages stored on the server.
  List<Message> get messages;
  @override

  /// Contains the messages from [messages] that are marked as unread.
  List<Message> get unreadMessages;
  @override

  /// The error message preventing Message operations from succeeding.
  String? get error;
  @override

  /// The current message the user is interacting with.
  Message? get currentMessage;
  @override

  /// The [Visit] that is associated with [currentMessage]
  Visit? get currentVisit;
  @override

  /// The index that [currentMessage] is located in [messages].
  int get currentIndex;
  @override

  /// The state of the user sending a message
  ReplyStatus get replyStatus;
  @override

  /// The state of the bloc fetching messages
  LoadingStatus get messageStatus;
  @override

  /// The reply written by the user so far as a response to [currentMessage].
  ///
  /// Will have a length less than or equal to 200 characters.
  String? get reply;
  @override
  @JsonKey(ignore: true)
  _$$_MessageStateCopyWith<_$_MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}
