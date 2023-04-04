// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:socket_io_client/socket_io_client.dart';

// Project imports:
import 'package:sdms_app/data/models/image_request.dart';
import 'package:sdms_app/data/models/message.dart';
import 'package:sdms_app/data/repositories/notification_repository.dart';
import 'package:sdms_app/globals.dart';

class NotificationProvider extends NotificationDataProvider {
  /// Broadcast stream for new messages from the SDMS server
  final _incomingMessages = StreamController<Message>.broadcast();

  /// Broadcast stream for new image requests from the SDMS server
  final _incomingImageRequests = StreamController<ImageRequest>.broadcast();

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
  Stream<Message> get incomingMessages => _incomingMessages.stream;

  @override
  Stream<ImageRequest> get incomingImageRequests =>
      _incomingImageRequests.stream;

  /// Initializes and opens a connection to the SDMS server
  @override
  void initConnection() {
    print("initializing server...");

    _socket.connect();
    _socket.onConnect((_) => print('connected'));

    _socket.on('message', (data) {
      print("Message received: ${data.toString()}");

      final message = Message.fromJson(data);
      _incomingMessages.add(message);
    });

    print("initialized socket!");
  }

  @override
  void initCameraConnection() {
    print("Initializing camera connection...");

    _socket.on('image', (data) async {
      print("Image request received");

      final imageRequest = ImageRequest.fromJson(data);
      _incomingImageRequests.add(imageRequest);
    });
  }

  void dispose() {
    _incomingMessages.close();
  }
}
