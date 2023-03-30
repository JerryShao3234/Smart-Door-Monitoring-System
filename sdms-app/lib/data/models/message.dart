// Package imports:

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const Message._();

  const factory Message({
    /// The unique id of this message
    @JsonKey(name: '_id') required String id,

    /// The user id of the user that this message is intended for
    @JsonKey(name: 'userID') required String userId,

    /// The body contents of the message
    @JsonKey(name: 'messageInfo') String? body,

    /// The milliseconds since epoch at which this message was
    /// sent to the server from the SDMS.
    @JsonKey(name: 'date') required int receivedAt,

    /// The sender of this message.
    @JsonKey(name: 'sender') required String sender,

    /// Whether this message has been marked as read by the user
    @JsonKey(name: 'read') required bool markedAsRead,

    /// The id of the visit that this message is related to.
    @JsonKey(name: 'visitID') required String visitId,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
