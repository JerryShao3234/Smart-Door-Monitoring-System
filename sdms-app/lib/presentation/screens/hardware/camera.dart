// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:beamer/beamer.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/bloc/hardware_bloc.dart';
import 'package:sdms_app/business/bloc/message_bloc.dart';
import 'package:sdms_app/data/binding.dart';
import 'package:sdms_app/data/repositories/notification_repository.dart';
import 'package:sdms_app/globals.dart';
import 'package:sdms_app/presentation/components/modal.dart';
import 'package:sdms_app/presentation/components/sdms_sidebar_menu.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/routes/home_locations.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

enum CameraType {
  front,
  back,
}

// A screen that allows users to take a picture using a given camera.
class CameraScreen extends StatefulWidget {
  CameraScreen({
    super.key,
  });

  final CameraDescription frontCamera = Globals.savedCameras.firstWhere(
    (element) => element.lensDirection == CameraLensDirection.front,
  );

  final CameraDescription backCamera = Globals.savedCameras.firstWhere(
    (element) => element.lensDirection == CameraLensDirection.back,
  );

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  CameraType cameraType = CameraType.front;

  @override
  void initState() {
    super.initState();
    _initCameras();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    // _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HardwareBloc, HardwareState>(
      listenWhen: (previous, current) =>
          previous.requestType != current.requestType,
      listener: (context, state) {
        Beamer.of(context).beamToNamed(HomeLocations.audioRoute);
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer:
            SidebarMenu(userName: context.read<MessageBloc>().state.user.name),
        body: SafeArea(
          child: RepositoryProvider(
            create: (context) => NotificationRepository(
              notificationProvider: AppDataBinding.notificationProvider,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: defaultPadding * 4,
                left: defaultPadding,
                right: defaultPadding,
                top: defaultPadding,
              ),
              child: Container(
                height: getProportionateScreenHeight(double.infinity),
                width: getProportionateScreenHeight(400),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: ConstColors.darkBlue,
                  width: 2.5,
                )),
                child: FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the Future is complete, display the preview.
                      return CameraPreview(_controller);
                    } else {
                      // Otherwise, display a loading indicator.
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: BlocBuilder<HardwareBloc, HardwareState>(
          buildWhen: (previous, current) =>
              previous.cameraStatus != current.cameraStatus,
          builder: (context, state) {
            return state.cameraStatus != CameraStatus.initial
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${state.cameraStatus.name}...",
                        style: const SdmsText().primaryItalic,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 2.5,
                              color: ConstColors.darkBlue,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: ConstColors.mediumBlue,
                        foregroundColor: ConstColors.darkBlue,
                        heroTag: "helpButton",
                        tooltip: "Help",
                        onPressed: () {
                          Modal(
                            context: context,
                            title: "Need help setting up the camera?",
                            message:
                                "Place this device on your SDMS so that the camera "
                                "has a clear view of visitors. You may choose to use "
                                "the front or back camera.",
                            buttonText: "Close",
                            icon: Icon(
                              Icons.help_rounded,
                              size: getProportionateScreenHeight(50),
                            ),
                          ).show();
                        },
                        child: const Icon(Icons.question_mark_rounded),
                      ),
                      SizedBox(
                          width: getProportionateScreenWidth(defaultPadding)),
                      FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 2.5,
                              color: ConstColors.darkBlue,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: ConstColors.mediumBlue,
                        foregroundColor: ConstColors.darkBlue,
                        heroTag: "switchCameraButton",
                        tooltip: "Switch camera",
                        onPressed: () {
                          try {
                            setState(() {
                              switch (cameraType) {
                                case CameraType.back:
                                  cameraType = CameraType.front;
                                  break;
                                case CameraType.front:
                                  cameraType = CameraType.back;
                                  break;
                              }
                            });

                            _initCameras();
                          } catch (e) {
                            // If an error occurs, log the error to the console.
                            print(e);
                          }
                        },
                        child: const Icon(Icons.undo),
                      ),
                      SizedBox(
                          width: getProportionateScreenWidth(defaultPadding)),
                      FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 2.5,
                              color: ConstColors.darkBlue,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: ConstColors.mediumBlue,
                        foregroundColor: ConstColors.darkBlue,
                        heroTag: "readyButton",
                        tooltip: "Done",
                        onPressed: () {
                          context
                              .read<HardwareBloc>()
                              .add(HardwareEvent.setupComplete(
                                controller: _controller,
                              ));
                        },
                        child: const Icon(Icons.check),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  void _initCameras() {
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      cameraType == CameraType.back ? widget.backCamera : widget.frontCamera,
      // Define the resolution to use.
      ResolutionPreset.low,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }
}
