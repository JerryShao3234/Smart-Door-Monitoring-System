part of 'hardware_bloc.dart';

/// Shows the state the [HardwareBloc] is in.
enum CameraStatus {
  /// User has chosen to use the device as a SDMS Hardware, but has not
  /// completed setup yet.
  initial,

  /// User has completed Hardware setup and is ready to take photos.
  ready,

  /// Server has requested a picture.
  taking,

  /// Image has been taken and is being sent to the server.
  sending,

  /// Image has successfully been sent to the server and another image
  /// can now be taken if needed.
  success,

  /// Failure state when error is not null
  failure,
}

enum AudioStatus {
  initial,
  recording,
  sending,
  success,
  failure,
}

enum RequestType {
  image,
  audio,
}

@freezed
class HardwareState with _$HardwareState {
  const factory HardwareState({
    /// The controller needed to take pictures
    CameraController? controller,

    /// The ID of the DE1-SoC associated with the most recent image request.
    String? imageSdmsId,

    /// The ID of the visitor associated with the most recent image request.
    String? imageVisitor,

    /// The ID of the DE1-SoC associated with the most recent audio request.
    String? audioSdmsId,

    /// The ID of the visitor associated with the most recent audio request.
    String? audioVisitor,

    /// The base64 representation of the most recent image captured by the Hardware.
    String? image,

    /// The error message to display when data is unable to be fetched from
    /// the server.
    String? error,

    /// Used to determine the state of the Hardware UI to show to the visitor.
    @Default(CameraStatus.initial) CameraStatus cameraStatus,

    /// Used to determine the state of the Hardware UI to show to the visitor.
    @Default(AudioStatus.initial) AudioStatus audioStatus,

    /// Used to determine which screen to show the visitor
    @Default(RequestType.image) RequestType requestType,
  }) = _HardwareState;
}
