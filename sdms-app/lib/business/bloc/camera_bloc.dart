// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:sdms_app/data/models/image_request.dart';
import 'package:sdms_app/data/repositories/notification_repository.dart';
import 'package:sdms_app/globals.dart';

part 'camera_event.dart';
part 'camera_state.dart';
part 'camera_bloc.freezed.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  /// The repository responsible for handling real-time communication
  /// between the app and the server.
  final NotificationRepository _notificationRepository;

  CameraBloc({
    required NotificationRepository notificationRepository,
  })  : _notificationRepository = notificationRepository,
        super(
          const CameraState(),
        ) {
    // Set up listeners for each event:
    on<CameraSetupComplete>(onCameraSetupComplete);
    on<CameraRequestReceived>(onCameraRequestReceived);

    // Set up the stream subscriptions
    _notificationRepository.incomingImageRequests.listen((imageRequest) {
      add(CameraEvent.requestReceived(imageRequest: imageRequest));
    });
  }

  void onCameraSetupComplete(
    CameraSetupComplete event,
    Emitter<CameraState> emit,
  ) {
    _notificationRepository.initConnection();
    _notificationRepository.initCameraConnection();

    emit(state.copyWith(
      cameraStatus: CameraStatus.ready,
      controller: event.controller,
    ));
  }

  Future<void> onCameraRequestReceived(
    CameraRequestReceived event,
    Emitter<CameraState> emit,
  ) async {
    emit(state.copyWith(
      cameraStatus: CameraStatus.taking,
      sdmsId: event.imageRequest.sdmsId,
      visitor: event.imageRequest.visitor,
    ));

    try {
      assert(state.sdmsId != null);
      assert(state.visitor != null);

      final image = await state.controller!.takePicture();
      final bytes = await image.readAsBytes();
      final encodedString = base64Encode(bytes);

      emit(state.copyWith(cameraStatus: CameraStatus.sending));

      final imageJson = {
        "de1socID": state.sdmsId,
        "visitor": state.visitor,
        "image": encodedString,
      };

      _notificationRepository.emitEvent("image", jsonEncode(imageJson));

      emit(state.copyWith(
        sdmsId: null,
        visitor: null,
        cameraStatus: CameraStatus.success,
        error: null,
      ));

      await Future.delayed(const Duration(seconds: 1));

      if (!isClosed) {
        emit(state.copyWith(cameraStatus: CameraStatus.ready));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(
        cameraStatus: CameraStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
