part of 'message_bloc.dart';

@freezed
class MessageEvent with _$MessageEvent {
  /// For when either the user logs in successfully and is taken to the
  /// home screen, or every 5 seconds after that.
  const factory MessageEvent.getAll() = MessageGetAll;

  /// For when a new message is received from the socket
  const factory MessageEvent.receivedNew({
    required Message message,
  }) = MessageReceivedNew;

  /// For when the current message being viewed by the user changes
  const factory MessageEvent.viewMessage({
    /// The id of the current message displayed
    required String id,
  }) = MessageViewMessage;

  /// For when the user marks a message as read or unread
  const factory MessageEvent.markReadUnread({
    /// The id of the message in question
    required String messageId,
  }) = MessageMarkReadUnread;

  /// For when the user modifies a character while typing the reply
  const factory MessageEvent.updateReply({
    /// The current text that the user is typing so far for the reply
    required String? replyText,
  }) = MessageUpdateReply;

  /// For when the user wants to send a reply
  const factory MessageEvent.sendReply({
    /// The body of the message to be sent to the SDMS
    required String? messageInfo,
  }) = MessageSendReply;
}
