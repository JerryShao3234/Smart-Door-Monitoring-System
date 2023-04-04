// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:sdms_app/business/bloc/camera_bloc.dart';
import 'package:sdms_app/business/bloc/message_bloc.dart';
import 'package:sdms_app/data/binding.dart';
import 'package:sdms_app/data/repositories/notification_repository.dart';
import 'package:sdms_app/globals.dart';
import 'package:sdms_app/presentation/components/modal.dart';
import 'package:sdms_app/presentation/components/sdms_app_bar.dart';
import 'package:sdms_app/presentation/components/sdms_sidebar_menu.dart';
import 'package:sdms_app/presentation/constants.dart';
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
  CameraType cameraType = CameraType.back;

  @override
  void initState() {
    super.initState();
    _initCameras();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: SDMSAppBar(
        appBarTitle: "SDMS Camera",
        callback: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
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
      floatingActionButton: BlocBuilder<CameraBloc, CameraState>(
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
                      backgroundColor: ConstColors.mediumBlue,
                      foregroundColor: ConstColors.darkBlue,
                      heroTag: "readyButton",
                      tooltip: "Done",
                      onPressed: () {
                        context
                            .read<CameraBloc>()
                            .add(CameraEvent.setupComplete(
                              controller: _controller,
                            ));
                      },
                      child: const Icon(Icons.check),
                    ),
                  ],
                );
        },
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
      ResolutionPreset.ultraHigh,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SDMSAppBar(
          appBarTitle: 'Preview of Image Captured',
          callback: () {
            print("hello");
          }),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Container(
              height: getProportionateScreenHeight(250),
              width: getProportionateScreenWidth(500),
              child: Image.file(
                File(imagePath),
              ),
            ),
            Text(
              "This is a preview of what the SDMS camera will capture. "
              "Press confirm to continue or back to adjust your camera.",
              style: SdmsText().primarySemiBold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    elevation: 5.0,
                    textStyle: const SdmsText().primarySemiBold,
                    backgroundColor: ConstColors.lightBlue,
                    foregroundColor: ConstColors.darkBlue,
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    // If the picture was taken, display it on a new screen.
                    Navigator.of(context).pop();
                  },
                  child: const Text('Back'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    elevation: 5.0,
                    textStyle: const SdmsText().primarySemiBold,
                    backgroundColor: ConstColors.mediumBlue,
                    foregroundColor: ConstColors.darkBlue,
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    // TODO
                  },
                  child: const Text('Confirm'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
