// Dart imports:
import 'dart:async';

// Project imports:
import 'package:sdms_app/data/models/audio_request.dart';
import 'package:sdms_app/data/models/image_request.dart';
import 'package:sdms_app/data/models/message.dart';

abstract class NotificationDataProvider {
  /// Opens a conection to to the server and initializes event handlers for
  /// incoming SDMS messages.
  void initConnection();

  /// The broadcast stream for new incoming messages in raw JSON format.
  Stream<Message> get incomingMessages;

  /// Broadcast stream for new image requests from the SDMS server
  Stream<ImageRequest> get incomingImageRequests;

  /// Broadcast stream for new audio requests from the SDMS server
  Stream<AudioRequest> get incomingAudioRequests;

  /// Broadcast stream for when to update UI after audio event
  Stream<String> get incomingAudioTwoRequests;

  /// Emits an event named [eventName] to the server, with parameters
  /// [eventParams].
  void emitEvent(eventName, eventParams);
}

class NotificationRepository {
  final NotificationDataProvider _notificationProvider;

  NotificationRepository({
    required NotificationDataProvider notificationProvider,
  }) : _notificationProvider = notificationProvider;

  Stream<Message> get incomingMessages =>
      _notificationProvider.incomingMessages;
  Stream<ImageRequest> get incomingImageRequests =>
      _notificationProvider.incomingImageRequests;
  Stream<AudioRequest> get incomingAudioRequests =>
      _notificationProvider.incomingAudioRequests;
  Stream<String> get incomingAudioTwoRequests =>
      _notificationProvider.incomingAudioTwoRequests;

  void emitEvent(eventName, eventParams) {
    _notificationProvider.emitEvent(eventName, eventParams);
  }

  void initConnection() {
    _notificationProvider.initConnection();
  }
}
