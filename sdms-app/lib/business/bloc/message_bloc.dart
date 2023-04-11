// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:sdms_app/data/models/message.dart';
import 'package:sdms_app/data/models/user.dart';
import 'package:sdms_app/data/models/visit.dart';
import 'package:sdms_app/data/repositories/message_repository.dart';
import 'package:sdms_app/data/repositories/notification_repository.dart';
import 'package:sdms_app/data/repositories/session_repository.dart';

part 'message_event.dart';
part 'message_state.dart';
part 'message_bloc.freezed.dart';

/// Bloc for handling messages such as retrieving the user's messages
/// and sending a reply to the server.
class MessageBloc extends Bloc<MessageEvent, MessageState> {
  /// Repository for working with messages.
  final MessageRepository _messageRepository;

  /// The repository responsible for handling real-time communication
  /// between the app and the server.
  final NotificationRepository _notificationRepository;

  MessageBloc({
    required MessageRepository messageRepository,
    required SessionRepository sessionRepository,
    required NotificationRepository notificationRepository,
  })  : _messageRepository = messageRepository,
        _notificationRepository = notificationRepository,
        super(
          MessageState(
            user: sessionRepository.user,
          ),
        ) {
    // Set up listeners for each event:
    on<MessageGetAll>(onMessageGetAll);
    on<MessageViewMessage>(onMessageViewMessage);
    on<MessageMarkReadUnread>(onMessageMarkReadUnread);
    on<MessageUpdateReply>(onMessageUpdateReply);
    on<MessageSendReply>(onMessageSendReply);

    // Set up the stream subscriptions
    _notificationRepository.incomingImageRequests.listen((message) async {
      await Future.delayed(
          const Duration(seconds: 2), () => add(const MessageEvent.getAll()));
    });

    _notificationRepository.incomingAudioRequests.listen((message) async {
      await Future.delayed(
          const Duration(seconds: 2), () => add(const MessageEvent.getAll()));
    });
  }

  /// Retrieves the list of all visits and updates the messages and visitor
  /// lists of the state.
  Future<void> onMessageGetAll(
    MessageGetAll event,
    Emitter<MessageState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          error: null,
          messageStatus: LoadingStatus.loading,
        ),
      );

      final visits = await _messageRepository.getAllVisits(state.user.token!);

      final messages = _messageRepository.getAllMessages(visits);

      final unreadMessages = _messageRepository.getUnreadMessages(messages);

      if (!isClosed) {
        emit(
          state.copyWith(
            visits: visits,
            messages: messages,
            unreadMessages: unreadMessages,
            error: null,
            messageStatus: LoadingStatus.success,
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(state.copyWith(
          error: e.toString(),
          messageStatus: LoadingStatus.failure,
        ));
      }
    }
  }

  void onMessageViewMessage(
    MessageViewMessage event,
    Emitter<MessageState> emit,
  ) {
    for (var i = 0; i < state.visits.length; i++) {
      var visit = state.visits[i];

      for (var index = 0; index < visit.messages.length; index++) {
        var message = visit.messages[index];
        if (message.id == event.id) {
          emit(state.copyWith(
            currentMessage: message,
            currentVisit: visit,
            currentIndex: index,
            replyStatus: ReplyStatus.initial,
            reply: null,
            error: null,
          ));
          return;
        }
      }
    }
  }

  Future<void> onMessageMarkReadUnread(
    MessageMarkReadUnread event,
    Emitter<MessageState> emit,
  ) async {
    try {
      emit(state.copyWith(replyStatus: ReplyStatus.marking));

      // Send response to server that message is marked read/unread
      await _messageRepository.markAsRead(
        state.user.token!,
        event.messageId,
      );

      final List<Message> updatedList = List.from(state.unreadMessages);
      updatedList.removeWhere((element) => element.id == event.messageId);

      emit(state.copyWith(
        replyStatus: ReplyStatus.marked,
        unreadMessages: updatedList,
      ));
    } catch (e) {
      print(e);
      if (!isClosed) {
        emit(state.copyWith(
          error: e.toString(),
          replyStatus: ReplyStatus.failure,
        ));
      }
    }
  }

  /// Updates the state with what the user has currently typed out
  /// as a reply
  void onMessageUpdateReply(
    MessageUpdateReply event,
    Emitter<MessageState> emit,
  ) {
    if (event.replyText != null) {
      emit(state.copyWith(
        reply: event.replyText!.trim(),
        replyStatus: ReplyStatus.typing,
        error: null,
      ));
    }
  }

  Future<void> onMessageSendReply(
    MessageSendReply event,
    Emitter<MessageState> emit,
  ) async {
    if (event.messageInfo == null) {
      state.replyStatus == ReplyStatus.typing
          ? emit(state.copyWith(
              replyStatus: ReplyStatus.initial,
            ))
          : emit(state.copyWith(
              replyStatus: ReplyStatus.typing,
            ));

      return;
    } else {
      try {
        assert(state.user.token != null);
        assert(state.currentMessage != null);

        emit(state.copyWith(
          replyStatus: ReplyStatus.sending,
        ));

        // Send reply to server
        await _messageRepository.sendMessage(
          state.user.token!,
          event.messageInfo!,
        );

        /// Automatically mark message as read
        await _messageRepository.markAsRead(
          state.user.token!,
          state.currentMessage!.id,
        );

        if (!isClosed) {
          // Reset [replyStatus] and [reply] (and error if applicable)
          emit(state.copyWith(
            replyStatus: ReplyStatus.success,
            reply: null,
            error: null,
          ));
        }

        add(const MessageGetAll());
      } catch (e) {
        print(e);

        if (!isClosed) {
          emit(state.copyWith(
            replyStatus: ReplyStatus.failure,
            error: e.toString(),
          ));
        }
      }
    }
  }
}
