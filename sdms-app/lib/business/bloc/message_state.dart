part of 'message_bloc.dart';

/// The status of the user sending a reply message to the server
enum ReplyStatus {
  /// User has not chosen to send reply yet
  initial,

  /// User is typing out the reply
  typing,

  /// The reply message is being sent
  sending,

  /// The reply has been successfully sent
  success,

  /// When the message is being marked as read
  marking,

  /// When the message has successfully been marked as read
  marked,

  /// The reply failed to send
  failure,
}

@freezed
class MessageState with _$MessageState {
  const factory MessageState({
    /// The current user associated with this session.
    required User user,

    /// The user's list of all visits.
    @Default([]) List<Visit> visits,

    /// The user's list of all messages stored on the server.
    @Default([]) List<Message> messages,

    /// Contains the messages from [messages] that are marked as unread.
    @Default([]) List<Message> unreadMessages,

    /// The error message preventing Message operations from succeeding.
    String? error,

    /// The current message the user is interacting with.
    Message? currentMessage,

    /// The [Visit] that is associated with [currentMessage]
    Visit? currentVisit,

    /// The index that [currentMessage] is located in [messages].
    @Default(0) int currentIndex,

    /// The state of the user sending a message
    @Default(ReplyStatus.initial) ReplyStatus replyStatus,

    /// The reply written by the user so far as a response to [currentMessage].
    ///
    /// Will have a length less than or equal to 200 characters.
    String? reply,
  }) = _MessageState;
}
