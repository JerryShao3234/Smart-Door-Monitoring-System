part of 'camera_bloc.dart';

/// Shows the state the [CameraBloc] is in.
enum CameraStatus {
  /// User has chosen to use the device as a SDMS camera, but has not
  /// completed setup yet.
  initial,

  /// User has completed camera setup and is ready to take photos.
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

@freezed
class CameraState with _$CameraState {
  const factory CameraState({
    /// The controller needed to take pictures
    CameraController? controller,

    /// The ID of the DE1-SoC associated with the most recent image request.
    String? sdmsId,

    /// The ID of the visitor associated with the most recent image request.
    String? visitor,

    /// The base64 representation of the most recent image captured by the camera.
    String? image,

    /// The error message to display when data is unable to be fetched from
    /// the server.
    String? error,

    /// Used to determine the state of the camera UI to show to the user.
    @Default(CameraStatus.initial) CameraStatus cameraStatus,
  }) = _CameraState;
}
