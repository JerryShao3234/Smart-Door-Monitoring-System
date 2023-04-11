// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import "package:http/http.dart" as http;
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:sdms_app/data/models/audio_request.dart';
import 'package:sdms_app/data/models/image_request.dart';
import 'package:sdms_app/data/repositories/notification_repository.dart';
import 'package:sdms_app/globals.dart';

part 'hardware_event.dart';
part 'hardware_state.dart';
part 'hardware_bloc.freezed.dart';

class HardwareBloc extends Bloc<HardwareEvent, HardwareState> {
  /// The repository responsible for handling real-time communication
  /// between the app and the server.
  final NotificationRepository _notificationRepository;

  HardwareBloc({required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository,
        super(
          const HardwareState(),
        ) {
    // Set up listeners for each event:
    on<HardwareSetupComplete>(onHardwareSetupComplete);
    on<CameraRequestReceived>(onCameraRequestReceived);
    on<AudioRequestReceived>(onAudioRequestReceived);
    on<AudioRecorded>(onAudioRecorded);

    // Set up the stream subscriptions
    _notificationRepository.incomingImageRequests.listen((imageRequest) {
      add(HardwareEvent.cameraRequestReceived(imageRequest: imageRequest));
    });

    _notificationRepository.incomingAudioRequests.listen((audioRequest) {
      add(HardwareEvent.audioRequestReceived(audioRequest: audioRequest));
    });
  }

  void onHardwareSetupComplete(
    HardwareSetupComplete event,
    Emitter<HardwareState> emit,
  ) {
    _notificationRepository.initConnection();
    Globals.isHardwareHelperDevice = true;

    emit(state.copyWith(
      cameraStatus: CameraStatus.ready,
      controller: event.controller,
    ));
  }

  Future<void> onCameraRequestReceived(
    CameraRequestReceived event,
    Emitter<HardwareState> emit,
  ) async {
    emit(state.copyWith(
      cameraStatus: CameraStatus.taking,
      imageSdmsId: event.imageRequest.sdmsId,
      imageVisitor: event.imageRequest.visitor,
    ));

    try {
      assert(state.imageSdmsId != null);
      assert(state.imageVisitor != null);

      final image = await state.controller!.takePicture();
      final bytes = await image.readAsBytes();
      final encodedString = base64Encode(bytes);

      emit(state.copyWith(cameraStatus: CameraStatus.sending));

      final imageJson = {
        "de1socID": state.imageSdmsId,
        "visitor": state.imageVisitor,
        "image": encodedString,
      };

      _notificationRepository.emitEvent("image", jsonEncode(imageJson));

      emit(state.copyWith(
        cameraStatus: CameraStatus.success,
        error: null,
      ));

      await Future.delayed(const Duration(seconds: 1));

      if (!isClosed) {
        emit(state.copyWith(
          cameraStatus: CameraStatus.ready,
          imageSdmsId: null,
          imageVisitor: null,
        ));
      }

      print("image success 🥳");
    } catch (e) {
      print(e);
      emit(state.copyWith(
        cameraStatus: CameraStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> onAudioRequestReceived(
    AudioRequestReceived event,
    Emitter<HardwareState> emit,
  ) async {
    try {
      emit(state.copyWith(
        requestType: RequestType.audio,
        audioSdmsId: event.audioRequest.sdmsId,
        audioVisitor: event.audioRequest.visitor,
      ));
    } catch (e) {
      print(e);
    }
  }

  Future<void> onAudioRecorded(
    AudioRecorded event,
    Emitter<HardwareState> emit,
  ) async {
    try {
      assert(state.audioSdmsId != null);
      assert(state.audioVisitor != null);

      var request = http.MultipartRequest(
        "POST",
        Uri.http(
          Globals.cloudUrl,
          'audio',
        ),
      );

      request.files.add(await http.MultipartFile.fromPath(
        "audio",
        "${await Globals.localPath}/audio.wav",
      ));

      request.fields["de1socID"] = state.audioSdmsId!;
      request.fields["visitor"] = state.audioVisitor!;

      final response = await request.send();
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      print(responseString);

      if (response.statusCode == 200) {
        print("Success! 🥳");
      }
    } catch (e) {
      print(e);
    }

    emit(state.copyWith(
      requestType: RequestType.image,
      audioSdmsId: null,
      audioVisitor: null,
    ));
  }
}
