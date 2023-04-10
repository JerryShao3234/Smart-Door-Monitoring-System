// Project imports:
import 'package:sdms_app/data/models/message.dart';
import 'package:sdms_app/data/models/visit.dart';

/// The abstract provider for both incoming and outgoing messages between
/// the App and the SDMS.
abstract class MessageDataProvider {
  /// Get the list of all visitor history.
  Future<List<Visit>> getAllVisits(String token);

  /// The most recent list of messages the App has received from the SDMS.
  List<Message> getAllMessages(List<Visit> visits);

  /// Get the list of all unread messages from the server.
  List<Message> getUnreadMessages(List<Message> messages);

  /// Sends [messageInfo] to the server, which will then be played on the
  /// SDMS speakers.
  Future<void> sendMessage(
    String token,
    String messageInfo,
  );

  /// Marks [message] as read, and updates its status on the server.
  Future<void> markAsRead(
    String token,
    String messageID,
  );
}

class MessageRepository {
  /// The provider for handling SDMS messages
  final MessageDataProvider _messageProvider;

  MessageRepository({
    required MessageDataProvider messageProvider,
  }) : _messageProvider = messageProvider;

  /// Gets all visitor history.
  Future<List<Visit>> getAllVisits(String token) async =>
      await _messageProvider.getAllVisits(token);

  /// The most recent list of messages the App has received from the SDMS.
  List<Message> getAllMessages(List<Visit> visits) =>
      _messageProvider.getAllMessages(visits);

  /// Get the list of all unread messages from the server.
  List<Message> getUnreadMessages(List<Message> messages) =>
      _messageProvider.getUnreadMessages(messages);

  /// Sends [message] to the server, which will then be played on the
  /// SDMS speakers.
  Future<void> sendMessage(String token, String messageInfo) async =>
      await _messageProvider.sendMessage(token, messageInfo);

  /// Marks [message] as read, and updates its status on the server.
  Future<void> markAsRead(String token, String messageID) async =>
      await _messageProvider.markAsRead(token, messageID);
}
