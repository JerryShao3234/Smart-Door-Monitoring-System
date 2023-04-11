// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:audioplayers/audioplayers.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record/record.dart';

// Project imports:
import 'package:sdms_app/business/bloc/hardware_bloc.dart';
import 'package:sdms_app/globals.dart';
import 'package:sdms_app/presentation/constants.dart';
import 'package:sdms_app/presentation/routes/home_locations.dart';
import 'package:sdms_app/presentation/size_config.dart';
import 'package:sdms_app/presentation/theme/sdms_text.dart';

class AudioRecorder extends StatefulWidget {
  final void Function(String path) onStop;

  const AudioRecorder({
    super.key,
    required this.onStop,
  });

  @override
  State<AudioRecorder> createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  int seconds = 3;
  Timer? _countdownTimer;
  Timer? _instructionTimer;
  Timer? _speakingTimer;
  bool showInstruction = true;
  bool showTimer = false;
  int instructionSeconds = 3;
  int speakingSeconds = 10;
  final _audioRecorder = Record();
  StreamSubscription<RecordState>? _recordSub;

  @override
  void initState() {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {});

    _instructionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (instructionSeconds == 0) {
        setState(() {
          timer.cancel();

          showTimer = true;

          _countdownTimer =
              Timer.periodic(const Duration(seconds: 1), (Timer timer) {
            if (seconds == 0) {
              setState(() {
                timer.cancel();

                _speakingTimer =
                    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
                  if (speakingSeconds == 0) {
                    setState(() {
                      timer.cancel();

                      _stop();
                    });
                  } else {
                    setState(() {
                      speakingSeconds--;
                    });
                  }
                });
              });
            } else if (seconds == 1) {
              _start();
              seconds--;
            } else {
              setState(() {
                seconds--;
              });
            }
          });
        });
      } else if (instructionSeconds <= 2 && showInstruction == true) {
        setState(() {
          showInstruction = false;
        });
      } else {
        setState(() {
          instructionSeconds--;
        });
      }
    });

    super.initState();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        // We don't do anything with this but printing
        final isSupported = await _audioRecorder.isEncoderSupported(
          AudioEncoder.wav,
        );

        print('${AudioEncoder.wav.name} supported: $isSupported');

        await _audioRecorder.start(
          path: "${await Globals.localPath}/audio.wav",
          encoder: AudioEncoder.wav,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stop() async {
    final path = await _audioRecorder.stop();

    if (path != null) {
      widget.onStop(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Container(
            margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(defaultPadding),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _instructionTimer?.cancel();
    _speakingTimer?.cancel();
    _countdownTimer?.cancel();
    _recordSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "~ Record message ~",
          style: const SdmsText().titleNumbers,
          textAlign: TextAlign.center,
        ),
        AnimatedCrossFade(
          crossFadeState: showInstruction
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 800),
          firstChild: SizedBox(
            width: getProportionateScreenWidth(300),
            height: getProportionateScreenHeight(600),
            child: Column(
              children: [
                Text(
                  "You will have max $speakingSeconds seconds to speak.",
                  style: const SdmsText().title3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                Text(
                  "The message will be sent once the time is up. "
                  "Please think of what to say...",
                  style: const SdmsText().title3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          secondChild: SizedBox(
            width: getProportionateScreenWidth(300),
            height: getProportionateScreenHeight(600),
            child: Column(
              children: [
                AnimatedOpacity(
                  opacity: showInstruction ? 0.0 : 1.0,
                  duration: const Duration(seconds: 3),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(80),
                      ),
                      seconds == 0
                          ? Column(
                              children: [
                                Icon(
                                  Icons.record_voice_over_rounded,
                                  size: getProportionateScreenHeight(150),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(50),
                                ),
                                Text(
                                  "Time left: $speakingSeconds",
                                  style: const SdmsText().title,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Text(
                                  "Please begin speaking in:",
                                  style: const SdmsText().title3,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(
                                      defaultPadding),
                                ),
                                Text(
                                  "$seconds",
                                  style: const SdmsText().title,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AudioScreen extends StatefulWidget {
  const AudioScreen({
    super.key,
  });

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  String? audioPath;
  final _audioRecorder = Record();
  StreamSubscription<RecordState>? _recordSub;

  @override
  void initState() {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HardwareBloc, HardwareState>(
      listenWhen: (previous, current) =>
          previous.requestType != current.requestType,
      listener: (context, state) {
        Beamer.of(context).beamToNamed(HomeLocations.cameraRoute);
      },
      child: Scaffold(
        body: Center(
          child: AudioRecorder(
            onStop: (path) async {
              context.read<HardwareBloc>().add(const AudioRecorded());

              // TODO: playback for debugging
              final player = AudioPlayer();
              await player.play(
                  DeviceFileSource("${await Globals.localPath}/audio.wav"));
              player.dispose();
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _recordSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }
}
