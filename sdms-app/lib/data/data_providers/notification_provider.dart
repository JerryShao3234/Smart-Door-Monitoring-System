// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:socket_io_client/socket_io_client.dart';

// Project imports:
import 'package:sdms_app/data/models/audio_request.dart';
import 'package:sdms_app/data/models/image_request.dart';
import 'package:sdms_app/data/models/message.dart' as SDMS;
import 'package:sdms_app/data/repositories/notification_repository.dart';
import 'package:sdms_app/globals.dart';

class NotificationProvider extends NotificationDataProvider {
  /// Broadcast stream for new messages from the SDMS server
  final _incomingMessages = StreamController<SDMS.Message>.broadcast();

  /// Broadcast stream for new image requests from the SDMS server
  final _incomingImageRequests = StreamController<ImageRequest>.broadcast();

  /// Broadcast stream for new audio requests from the SDMS server
  final _incomingAudioRequests = StreamController<AudioRequest>.broadcast();

  /// Broadcast stream for when to update messages after audio recording
  final _incomingAudioTwoRequests = StreamController<String>.broadcast();

  /// The SDMS server URI
  final _sdmsUri = "http://${Globals.cloudUrl}";

  /// The socket used for all connections and event emits
  late final Socket _socket = io(
    _sdmsUri,
    OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
  );

  @override
  void emitEvent(eventName, eventParams) {
    _socket.emit(eventName, eventParams);
    return;
  }

  @override
  Stream<SDMS.Message> get incomingMessages => _incomingMessages.stream;

  @override
  Stream<ImageRequest> get incomingImageRequests =>
      _incomingImageRequests.stream;

  @override
  Stream<AudioRequest> get incomingAudioRequests =>
      _incomingAudioRequests.stream;

  /// Initializes and opens a connection to the SDMS server
  @override
  void initConnection() {
    print("initializing socket...");

    _socket.connect();
    _socket.onConnect((_) => print('connected'));

    _socket.on('message', (data) {
      print("Message received: $data");

      final message = SDMS.Message.fromJson(data);
      _incomingMessages.add(message);
    });

    _socket.on('image', (data) async {
      print("Image request received");

      final imageRequest = ImageRequest.fromJson(data);
      _incomingImageRequests.add(imageRequest);

      if (Globals.isHardwareHelperDevice == false) {
        Globals.readyToShowNotifications = true;

        // Show push notifications on a new visit
        await Future.delayed(const Duration(seconds: 2), () async {
          if (Globals.readyToShowNotifications) {
            await _showNotification(
                'Knock knock!',
                "A visitor arrived at your door. "
                    "Tap to check your SDMS messages.");

            Globals.readyToShowNotifications = false;
          }
        });
      }
    });

    _socket.on('audio', (data) async {
      print("Audio request received");

      final audioRequest = AudioRequest.fromJson(data);
      _incomingAudioRequests.add(audioRequest);
    });

    _socket.on('audiotwo', (data) async {
      print("Update audio messages received");

      _incomingAudioTwoRequests.add(data);
    });

    print("Hardware connections successfully initialized!");
  }

  void dispose() {
    _incomingMessages.close();
  }

  Future<void> _showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'sdms_channel_id',
      'sdms_channel_name',
      channelDescription: 'sdms_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'You have a new SDMS message!',
      playSound: true,
      styleInformation: BigTextStyleInformation(''),
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await Globals.flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  @override
  Stream<String> get incomingAudioTwoRequests =>
      _incomingAudioTwoRequests.stream;
}
