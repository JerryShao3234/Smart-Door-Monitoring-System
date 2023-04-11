library sdms.globals;

// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:camera/camera.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class Globals {
  /// Whether the app should show a push notification
  static bool readyToShowNotifications = false;

  /// Whether this device is mounted on the SDMS to help with hardware
  static bool isHardwareHelperDevice = false;

  /// The cameras available on the current device
  static List<CameraDescription> savedCameras = [];

  /// The controller for push notifications
  static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  /// Saves the available cameras to [cameras]
  static void saveCameras(List<CameraDescription> cameras) {
    savedCameras.addAll(cameras);
  }

  /// The address of the cloud server
  static const String cloudUrl = "155.248.237.255:3000";

  /// Converts milliseconds since epoch to a DateTime format as such below:
  /// Feb 10, 2023, 10:21 AM
  static String formatDateTime(int timestamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var date = DateFormat.yMMMd('en_US').format(dateTime);
    var time = DateFormat.jm('en_US').format(dateTime);
    var result = "$date, $time";
    return result;
  }

  /// Converts a base64 String to an image and returns that image.
  static MemoryImage imageFromBase64String(String base64String) {
    return MemoryImage(base64Decode(base64String));
  }

  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get localFile async {
    final path = await localPath;
    return File('$path/audio.wav');
  }

  static Future<void> initPushNotifs(
      GlobalKey<NavigatorState> navigatorKey) async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {},
    );
  }
}
