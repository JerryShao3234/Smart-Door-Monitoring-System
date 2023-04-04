library main;

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/bloc/camera_bloc.dart';
import 'package:sdms_app/business/bloc/message_bloc.dart';
import 'package:sdms_app/business/cubit/session_cubit.dart';
import 'package:sdms_app/data/binding.dart';
import 'package:sdms_app/data/repositories/message_repository.dart';
import 'package:sdms_app/data/repositories/notification_repository.dart';
import 'package:sdms_app/data/repositories/session_repository.dart';
import 'package:sdms_app/data/repositories/user_repository.dart';
import 'package:sdms_app/globals.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/routes/home_locations.dart';
import 'package:sdms_app/presentation/routes/unauthenticated_locations.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

part 'presentation/routes/routes.dart';
part 'presentation/theme/theme.dart';

void main() async {
  // Make sure Flutter is initialized before calling native code
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device and save it for
  // future use.
  final cameras = await availableCameras();
  Globals.saveCameras(cameras);

  //Lock the orientation to portrait mode only.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // All initialized, start the app
  runApp(App(
    sessionRepository: SessionRepository(
      sessionProvider: AppDataBinding.sessionProvider,
    ),
    userRepository: UserRepository(
      userProvider: AppDataBinding.userProvider,
    ),
    notificationRepository: NotificationRepository(
      notificationProvider: AppDataBinding.notificationProvider,
    ),
    messageRepository: MessageRepository(
      messageProvider: AppDataBinding.messageProvider,
    ),
  ));
}

class App extends StatelessWidget {
  /// Repository to handle user session actions like login / logout
  final SessionRepository sessionRepository;

  /// Repository to handle user account actions like create user, reset password
  final UserRepository userRepository;

  /// Repository to handle real-time communication with the server
  final NotificationRepository notificationRepository;

  /// Repository for retrieving message and visitor data
  final MessageRepository messageRepository;

  const App({
    super.key,
    required this.sessionRepository,
    required this.userRepository,
    required this.notificationRepository,
    required this.messageRepository,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SessionRepository>.value(
          value: sessionRepository,
        ),
        RepositoryProvider<UserRepository>.value(
          value: userRepository,
        ),
        RepositoryProvider<NotificationRepository>.value(
          value: notificationRepository,
        ),
        RepositoryProvider<MessageRepository>.value(
          value: messageRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SessionCubit(
              sessionRepository: sessionRepository,
            ),
          ),
          BlocProvider(
            create: (_) => MessageBloc(
              messageRepository: messageRepository,
              sessionRepository: sessionRepository,
              notificationRepository: notificationRepository,
            ),
          ),
          BlocProvider(
            create: (_) => CameraBloc(
              notificationRepository: notificationRepository,
            ),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!FocusScope.of(context).hasPrimaryFocus) {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: _theme,
        //Routes are detailed in presentation/routes.dart
        routeInformationParser: BeamerParser(),
        routerDelegate: _routerDelegate,
        backButtonDispatcher: BeamerBackButtonDispatcher(
          delegate: _routerDelegate,
          fallbackToBeamBack: false,
        ),
      ),
    );
  }
}
