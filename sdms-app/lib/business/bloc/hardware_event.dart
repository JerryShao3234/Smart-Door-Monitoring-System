part of 'hardware_bloc.dart';

@freezed
class HardwareEvent with _$HardwareEvent {
  const factory HardwareEvent.setupComplete({
    required CameraController controller,
  }) = HardwareSetupComplete;

  const factory HardwareEvent.cameraRequestReceived({
    required ImageRequest imageRequest,
  }) = CameraRequestReceived;

  const factory HardwareEvent.audioRequestReceived({
    required AudioRequest audioRequest,
  }) = AudioRequestReceived;

  const factory HardwareEvent.audioRecorded() = AudioRecorded;
}
