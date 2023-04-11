// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:beamer/beamer.dart';

// Project imports:
import 'package:sdms_app/presentation/routes/sdms_beam_page.dart';
import 'package:sdms_app/presentation/screens/customize/customize.dart';
import 'package:sdms_app/presentation/screens/hardware/audio.dart';
import 'package:sdms_app/presentation/screens/hardware/camera.dart';
import 'package:sdms_app/presentation/screens/home/home.dart';
import 'package:sdms_app/presentation/screens/messages/messages.dart';
import 'package:sdms_app/presentation/screens/settings/settings.dart';
import 'package:sdms_app/presentation/screens/visitor_history/visitor_history.dart';

class HomeLocations extends BeamLocation<BeamState> {
  /// beamToNamed location for the [HomeScreen]
  static const String homeRoute = '/home';

  /// beamToNamed location for the [MessagesScreen]
  static const String messagesRoute = '/messages';

  /// beamToNamed location for the [VisitorHistoryScreen]
  static const String visitorHistoryRoute = '/visitor_history';

  /// beamToNamed location for the [CustomizeScreen]
  static const String customizeRoute = '/customize';

  /// beamToNamed location for the [SettingsScreen]
  static const String settingsRoute = '/settings';

  /// beamToNamed location for the [CameraScreen]
  static const String cameraRoute = '/camera';

  /// beamToNamed location for the [AudioScreen]
  static const String audioRoute = '/audio';

  @override
  List<Pattern> get pathPatterns => _pathPatterns;

  static const List<Pattern> _pathPatterns = [
    //Routes with no nested navigators can be added by path directly:
    homeRoute,
    messagesRoute,
    visitorHistoryRoute,
    customizeRoute,
    settingsRoute,
    cameraRoute,
    audioRoute,
  ];

  @override
  List<SdmsBeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      SdmsBeamPage(
        path: homeRoute,
        popToNamed: null,
        child: const HomeScreen(),
      ),
      if (state.uri.path == messagesRoute) ...[
        SdmsBeamPage(
          path: messagesRoute,
          popToNamed: homeRoute,
          child: const MessagesScreen(),
          enableSwipeToGoBack: true,
        )
      ],
      if (state.uri.path == visitorHistoryRoute) ...[
        SdmsBeamPage(
          path: visitorHistoryRoute,
          popToNamed: homeRoute,
          child: const VisitorHistoryScreen(),
        )
      ],
      if (state.uri.path == customizeRoute) ...[
        SdmsBeamPage(
          path: customizeRoute,
          popToNamed: homeRoute,
          child: const CustomizeScreen(),
        )
      ],
      if (state.uri.path == settingsRoute) ...[
        SdmsBeamPage(
          path: settingsRoute,
          popToNamed: homeRoute,
          child: const SettingsScreen(),
        )
      ],
      if (state.uri.path == cameraRoute) ...[
        SdmsBeamPage(
          path: cameraRoute,
          popToNamed: settingsRoute,
          child: CameraScreen(),
        )
      ],
      if (state.uri.path == audioRoute) ...[
        SdmsBeamPage(
          path: audioRoute,
          popToNamed: settingsRoute,
          child: const AudioScreen(),
        )
      ]
    ];
  }
}
