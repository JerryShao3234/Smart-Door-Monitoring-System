part of 'camera_bloc.dart';

@freezed
class CameraEvent with _$CameraEvent {
  const factory CameraEvent.setupComplete({
    required CameraController controller,
  }) = CameraSetupComplete;

  const factory CameraEvent.requestReceived({
    required ImageRequest imageRequest,
  }) = CameraRequestReceived;
}
