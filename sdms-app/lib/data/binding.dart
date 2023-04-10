// Project imports:
import 'package:sdms_app/data/data_providers/message_provider.dart';
import 'package:sdms_app/data/data_providers/notification_provider.dart';
import 'package:sdms_app/data/data_providers/session_provider.dart';
import 'package:sdms_app/data/data_providers/user_provider.dart';

class AppDataBinding {
  // Declare all data providers as singletons
  static SessionProvider? _sessionProvider;
  static UserProvider? _userProvider;
  static MessageProvider? _messageProvider;
  static NotificationProvider? _notificationProvider;

  //Access the providers with public getters
  static SessionProvider get sessionProvider {
    _sessionProvider ??= SessionProvider();
    return _sessionProvider!;
  }

  static UserProvider get userProvider {
    _userProvider ??= UserProvider();
    return _userProvider!;
  }

  static MessageProvider get messageProvider {
    _messageProvider ??= MessageProvider();
    return _messageProvider!;
  }

  static NotificationProvider get notificationProvider {
    _notificationProvider ??= NotificationProvider();
    return _notificationProvider!;
  }
}
