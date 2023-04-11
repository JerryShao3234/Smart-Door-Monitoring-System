// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hardware_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HardwareEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CameraController controller) setupComplete,
    required TResult Function(ImageRequest imageRequest) cameraRequestReceived,
    required TResult Function(AudioRequest audioRequest) audioRequestReceived,
    required TResult Function() audioRecorded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CameraController controller)? setupComplete,
    TResult? Function(ImageRequest imageRequest)? cameraRequestReceived,
    TResult? Function(AudioRequest audioRequest)? audioRequestReceived,
    TResult? Function()? audioRecorded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CameraController controller)? setupComplete,
    TResult Function(ImageRequest imageRequest)? cameraRequestReceived,
    TResult Function(AudioRequest audioRequest)? audioRequestReceived,
    TResult Function()? audioRecorded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HardwareSetupComplete value) setupComplete,
    required TResult Function(CameraRequestReceived value)
        cameraRequestReceived,
    required TResult Function(AudioRequestReceived value) audioRequestReceived,
    required TResult Function(AudioRecorded value) audioRecorded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HardwareSetupComplete value)? setupComplete,
    TResult? Function(CameraRequestReceived value)? cameraRequestReceived,
    TResult? Function(AudioRequestReceived value)? audioRequestReceived,
    TResult? Function(AudioRecorded value)? audioRecorded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HardwareSetupComplete value)? setupComplete,
    TResult Function(CameraRequestReceived value)? cameraRequestReceived,
    TResult Function(AudioRequestReceived value)? audioRequestReceived,
    TResult Function(AudioRecorded value)? audioRecorded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HardwareEventCopyWith<$Res> {
  factory $HardwareEventCopyWith(
          HardwareEvent value, $Res Function(HardwareEvent) then) =
      _$HardwareEventCopyWithImpl<$Res, HardwareEvent>;
}

/// @nodoc
class _$HardwareEventCopyWithImpl<$Res, $Val extends HardwareEvent>
    implements $HardwareEventCopyWith<$Res> {
  _$HardwareEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HardwareSetupCompleteCopyWith<$Res> {
  factory _$$HardwareSetupCompleteCopyWith(_$HardwareSetupComplete value,
          $Res Function(_$HardwareSetupComplete) then) =
      __$$HardwareSetupCompleteCopyWithImpl<$Res>;
  @useResult
  $Res call({CameraController controller});
}

/// @nodoc
class __$$HardwareSetupCompleteCopyWithImpl<$Res>
    extends _$HardwareEventCopyWithImpl<$Res, _$HardwareSetupComplete>
    implements _$$HardwareSetupCompleteCopyWith<$Res> {
  __$$HardwareSetupCompleteCopyWithImpl(_$HardwareSetupComplete _value,
      $Res Function(_$HardwareSetupComplete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
  }) {
    return _then(_$HardwareSetupComplete(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController,
    ));
  }
}

/// @nodoc

class _$HardwareSetupComplete implements HardwareSetupComplete {
  const _$HardwareSetupComplete({required this.controller});

  @override
  final CameraController controller;

  @override
  String toString() {
    return 'HardwareEvent.setupComplete(controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HardwareSetupComplete &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HardwareSetupCompleteCopyWith<_$HardwareSetupComplete> get copyWith =>
      __$$HardwareSetupCompleteCopyWithImpl<_$HardwareSetupComplete>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CameraController controller) setupComplete,
    required TResult Function(ImageRequest imageRequest) cameraRequestReceived,
    required TResult Function(AudioRequest audioRequest) audioRequestReceived,
    required TResult Function() audioRecorded,
  }) {
    return setupComplete(controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CameraController controller)? setupComplete,
    TResult? Function(ImageRequest imageRequest)? cameraRequestReceived,
    TResult? Function(AudioRequest audioRequest)? audioRequestReceived,
    TResult? Function()? audioRecorded,
  }) {
    return setupComplete?.call(controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CameraController controller)? setupComplete,
    TResult Function(ImageRequest imageRequest)? cameraRequestReceived,
    TResult Function(AudioRequest audioRequest)? audioRequestReceived,
    TResult Function()? audioRecorded,
    required TResult orElse(),
  }) {
    if (setupComplete != null) {
      return setupComplete(controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HardwareSetupComplete value) setupComplete,
    required TResult Function(CameraRequestReceived value)
        cameraRequestReceived,
    required TResult Function(AudioRequestReceived value) audioRequestReceived,
    required TResult Function(AudioRecorded value) audioRecorded,
  }) {
    return setupComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HardwareSetupComplete value)? setupComplete,
    TResult? Function(CameraRequestReceived value)? cameraRequestReceived,
    TResult? Function(AudioRequestReceived value)? audioRequestReceived,
    TResult? Function(AudioRecorded value)? audioRecorded,
  }) {
    return setupComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HardwareSetupComplete value)? setupComplete,
    TResult Function(CameraRequestReceived value)? cameraRequestReceived,
    TResult Function(AudioRequestReceived value)? audioRequestReceived,
    TResult Function(AudioRecorded value)? audioRecorded,
    required TResult orElse(),
  }) {
    if (setupComplete != null) {
      return setupComplete(this);
    }
    return orElse();
  }
}

abstract class HardwareSetupComplete implements HardwareEvent {
  const factory HardwareSetupComplete(
      {required final CameraController controller}) = _$HardwareSetupComplete;

  CameraController get controller;
  @JsonKey(ignore: true)
  _$$HardwareSetupCompleteCopyWith<_$HardwareSetupComplete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CameraRequestReceivedCopyWith<$Res> {
  factory _$$CameraRequestReceivedCopyWith(_$CameraRequestReceived value,
          $Res Function(_$CameraRequestReceived) then) =
      __$$CameraRequestReceivedCopyWithImpl<$Res>;
  @useResult
  $Res call({ImageRequest imageRequest});

  $ImageRequestCopyWith<$Res> get imageRequest;
}

/// @nodoc
class __$$CameraRequestReceivedCopyWithImpl<$Res>
    extends _$HardwareEventCopyWithImpl<$Res, _$CameraRequestReceived>
    implements _$$CameraRequestReceivedCopyWith<$Res> {
  __$$CameraRequestReceivedCopyWithImpl(_$CameraRequestReceived _value,
      $Res Function(_$CameraRequestReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageRequest = null,
  }) {
    return _then(_$CameraRequestReceived(
      imageRequest: null == imageRequest
          ? _value.imageRequest
          : imageRequest // ignore: cast_nullable_to_non_nullable
              as ImageRequest,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageRequestCopyWith<$Res> get imageRequest {
    return $ImageRequestCopyWith<$Res>(_value.imageRequest, (value) {
      return _then(_value.copyWith(imageRequest: value));
    });
  }
}

/// @nodoc

class _$CameraRequestReceived implements CameraRequestReceived {
  const _$CameraRequestReceived({required this.imageRequest});

  @override
  final ImageRequest imageRequest;

  @override
  String toString() {
    return 'HardwareEvent.cameraRequestReceived(imageRequest: $imageRequest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraRequestReceived &&
            (identical(other.imageRequest, imageRequest) ||
                other.imageRequest == imageRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraRequestReceivedCopyWith<_$CameraRequestReceived> get copyWith =>
      __$$CameraRequestReceivedCopyWithImpl<_$CameraRequestReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CameraController controller) setupComplete,
    required TResult Function(ImageRequest imageRequest) cameraRequestReceived,
    required TResult Function(AudioRequest audioRequest) audioRequestReceived,
    required TResult Function() audioRecorded,
  }) {
    return cameraRequestReceived(imageRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CameraController controller)? setupComplete,
    TResult? Function(ImageRequest imageRequest)? cameraRequestReceived,
    TResult? Function(AudioRequest audioRequest)? audioRequestReceived,
    TResult? Function()? audioRecorded,
  }) {
    return cameraRequestReceived?.call(imageRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CameraController controller)? setupComplete,
    TResult Function(ImageRequest imageRequest)? cameraRequestReceived,
    TResult Function(AudioRequest audioRequest)? audioRequestReceived,
    TResult Function()? audioRecorded,
    required TResult orElse(),
  }) {
    if (cameraRequestReceived != null) {
      return cameraRequestReceived(imageRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HardwareSetupComplete value) setupComplete,
    required TResult Function(CameraRequestReceived value)
        cameraRequestReceived,
    required TResult Function(AudioRequestReceived value) audioRequestReceived,
    required TResult Function(AudioRecorded value) audioRecorded,
  }) {
    return cameraRequestReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HardwareSetupComplete value)? setupComplete,
    TResult? Function(CameraRequestReceived value)? cameraRequestReceived,
    TResult? Function(AudioRequestReceived value)? audioRequestReceived,
    TResult? Function(AudioRecorded value)? audioRecorded,
  }) {
    return cameraRequestReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HardwareSetupComplete value)? setupComplete,
    TResult Function(CameraRequestReceived value)? cameraRequestReceived,
    TResult Function(AudioRequestReceived value)? audioRequestReceived,
    TResult Function(AudioRecorded value)? audioRecorded,
    required TResult orElse(),
  }) {
    if (cameraRequestReceived != null) {
      return cameraRequestReceived(this);
    }
    return orElse();
  }
}

abstract class CameraRequestReceived implements HardwareEvent {
  const factory CameraRequestReceived(
      {required final ImageRequest imageRequest}) = _$CameraRequestReceived;

  ImageRequest get imageRequest;
  @JsonKey(ignore: true)
  _$$CameraRequestReceivedCopyWith<_$CameraRequestReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AudioRequestReceivedCopyWith<$Res> {
  factory _$$AudioRequestReceivedCopyWith(_$AudioRequestReceived value,
          $Res Function(_$AudioRequestReceived) then) =
      __$$AudioRequestReceivedCopyWithImpl<$Res>;
  @useResult
  $Res call({AudioRequest audioRequest});

  $AudioRequestCopyWith<$Res> get audioRequest;
}

/// @nodoc
class __$$AudioRequestReceivedCopyWithImpl<$Res>
    extends _$HardwareEventCopyWithImpl<$Res, _$AudioRequestReceived>
    implements _$$AudioRequestReceivedCopyWith<$Res> {
  __$$AudioRequestReceivedCopyWithImpl(_$AudioRequestReceived _value,
      $Res Function(_$AudioRequestReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioRequest = null,
  }) {
    return _then(_$AudioRequestReceived(
      audioRequest: null == audioRequest
          ? _value.audioRequest
          : audioRequest // ignore: cast_nullable_to_non_nullable
              as AudioRequest,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AudioRequestCopyWith<$Res> get audioRequest {
    return $AudioRequestCopyWith<$Res>(_value.audioRequest, (value) {
      return _then(_value.copyWith(audioRequest: value));
    });
  }
}

/// @nodoc

class _$AudioRequestReceived implements AudioRequestReceived {
  const _$AudioRequestReceived({required this.audioRequest});

  @override
  final AudioRequest audioRequest;

  @override
  String toString() {
    return 'HardwareEvent.audioRequestReceived(audioRequest: $audioRequest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioRequestReceived &&
            (identical(other.audioRequest, audioRequest) ||
                other.audioRequest == audioRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioRequestReceivedCopyWith<_$AudioRequestReceived> get copyWith =>
      __$$AudioRequestReceivedCopyWithImpl<_$AudioRequestReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CameraController controller) setupComplete,
    required TResult Function(ImageRequest imageRequest) cameraRequestReceived,
    required TResult Function(AudioRequest audioRequest) audioRequestReceived,
    required TResult Function() audioRecorded,
  }) {
    return audioRequestReceived(audioRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CameraController controller)? setupComplete,
    TResult? Function(ImageRequest imageRequest)? cameraRequestReceived,
    TResult? Function(AudioRequest audioRequest)? audioRequestReceived,
    TResult? Function()? audioRecorded,
  }) {
    return audioRequestReceived?.call(audioRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CameraController controller)? setupComplete,
    TResult Function(ImageRequest imageRequest)? cameraRequestReceived,
    TResult Function(AudioRequest audioRequest)? audioRequestReceived,
    TResult Function()? audioRecorded,
    required TResult orElse(),
  }) {
    if (audioRequestReceived != null) {
      return audioRequestReceived(audioRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HardwareSetupComplete value) setupComplete,
    required TResult Function(CameraRequestReceived value)
        cameraRequestReceived,
    required TResult Function(AudioRequestReceived value) audioRequestReceived,
    required TResult Function(AudioRecorded value) audioRecorded,
  }) {
    return audioRequestReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HardwareSetupComplete value)? setupComplete,
    TResult? Function(CameraRequestReceived value)? cameraRequestReceived,
    TResult? Function(AudioRequestReceived value)? audioRequestReceived,
    TResult? Function(AudioRecorded value)? audioRecorded,
  }) {
    return audioRequestReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HardwareSetupComplete value)? setupComplete,
    TResult Function(CameraRequestReceived value)? cameraRequestReceived,
    TResult Function(AudioRequestReceived value)? audioRequestReceived,
    TResult Function(AudioRecorded value)? audioRecorded,
    required TResult orElse(),
  }) {
    if (audioRequestReceived != null) {
      return audioRequestReceived(this);
    }
    return orElse();
  }
}

abstract class AudioRequestReceived implements HardwareEvent {
  const factory AudioRequestReceived(
      {required final AudioRequest audioRequest}) = _$AudioRequestReceived;

  AudioRequest get audioRequest;
  @JsonKey(ignore: true)
  _$$AudioRequestReceivedCopyWith<_$AudioRequestReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AudioRecordedCopyWith<$Res> {
  factory _$$AudioRecordedCopyWith(
          _$AudioRecorded value, $Res Function(_$AudioRecorded) then) =
      __$$AudioRecordedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AudioRecordedCopyWithImpl<$Res>
    extends _$HardwareEventCopyWithImpl<$Res, _$AudioRecorded>
    implements _$$AudioRecordedCopyWith<$Res> {
  __$$AudioRecordedCopyWithImpl(
      _$AudioRecorded _value, $Res Function(_$AudioRecorded) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AudioRecorded implements AudioRecorded {
  const _$AudioRecorded();

  @override
  String toString() {
    return 'HardwareEvent.audioRecorded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AudioRecorded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CameraController controller) setupComplete,
    required TResult Function(ImageRequest imageRequest) cameraRequestReceived,
    required TResult Function(AudioRequest audioRequest) audioRequestReceived,
    required TResult Function() audioRecorded,
  }) {
    return audioRecorded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CameraController controller)? setupComplete,
    TResult? Function(ImageRequest imageRequest)? cameraRequestReceived,
    TResult? Function(AudioRequest audioRequest)? audioRequestReceived,
    TResult? Function()? audioRecorded,
  }) {
    return audioRecorded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CameraController controller)? setupComplete,
    TResult Function(ImageRequest imageRequest)? cameraRequestReceived,
    TResult Function(AudioRequest audioRequest)? audioRequestReceived,
    TResult Function()? audioRecorded,
    required TResult orElse(),
  }) {
    if (audioRecorded != null) {
      return audioRecorded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HardwareSetupComplete value) setupComplete,
    required TResult Function(CameraRequestReceived value)
        cameraRequestReceived,
    required TResult Function(AudioRequestReceived value) audioRequestReceived,
    required TResult Function(AudioRecorded value) audioRecorded,
  }) {
    return audioRecorded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HardwareSetupComplete value)? setupComplete,
    TResult? Function(CameraRequestReceived value)? cameraRequestReceived,
    TResult? Function(AudioRequestReceived value)? audioRequestReceived,
    TResult? Function(AudioRecorded value)? audioRecorded,
  }) {
    return audioRecorded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HardwareSetupComplete value)? setupComplete,
    TResult Function(CameraRequestReceived value)? cameraRequestReceived,
    TResult Function(AudioRequestReceived value)? audioRequestReceived,
    TResult Function(AudioRecorded value)? audioRecorded,
    required TResult orElse(),
  }) {
    if (audioRecorded != null) {
      return audioRecorded(this);
    }
    return orElse();
  }
}

abstract class AudioRecorded implements HardwareEvent {
  const factory AudioRecorded() = _$AudioRecorded;
}

/// @nodoc
mixin _$HardwareState {
  /// The controller needed to take pictures
  CameraController? get controller => throw _privateConstructorUsedError;

  /// The ID of the DE1-SoC associated with the most recent image request.
  String? get imageSdmsId => throw _privateConstructorUsedError;

  /// The ID of the visitor associated with the most recent image request.
  String? get imageVisitor => throw _privateConstructorUsedError;

  /// The ID of the DE1-SoC associated with the most recent audio request.
  String? get audioSdmsId => throw _privateConstructorUsedError;

  /// The ID of the visitor associated with the most recent audio request.
  String? get audioVisitor => throw _privateConstructorUsedError;

  /// The base64 representation of the most recent image captured by the Hardware.
  String? get image => throw _privateConstructorUsedError;

  /// The error message to display when data is unable to be fetched from
  /// the server.
  String? get error => throw _privateConstructorUsedError;

  /// Used to determine the state of the Hardware UI to show to the visitor.
  CameraStatus get cameraStatus => throw _privateConstructorUsedError;

  /// Used to determine the state of the Hardware UI to show to the visitor.
  AudioStatus get audioStatus => throw _privateConstructorUsedError;

  /// Used to determine which screen to show the visitor
  RequestType get requestType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HardwareStateCopyWith<HardwareState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HardwareStateCopyWith<$Res> {
  factory $HardwareStateCopyWith(
          HardwareState value, $Res Function(HardwareState) then) =
      _$HardwareStateCopyWithImpl<$Res, HardwareState>;
  @useResult
  $Res call(
      {CameraController? controller,
      String? imageSdmsId,
      String? imageVisitor,
      String? audioSdmsId,
      String? audioVisitor,
      String? image,
      String? error,
      CameraStatus cameraStatus,
      AudioStatus audioStatus,
      RequestType requestType});
}

/// @nodoc
class _$HardwareStateCopyWithImpl<$Res, $Val extends HardwareState>
    implements $HardwareStateCopyWith<$Res> {
  _$HardwareStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? imageSdmsId = freezed,
    Object? imageVisitor = freezed,
    Object? audioSdmsId = freezed,
    Object? audioVisitor = freezed,
    Object? image = freezed,
    Object? error = freezed,
    Object? cameraStatus = null,
    Object? audioStatus = null,
    Object? requestType = null,
  }) {
    return _then(_value.copyWith(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      imageSdmsId: freezed == imageSdmsId
          ? _value.imageSdmsId
          : imageSdmsId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageVisitor: freezed == imageVisitor
          ? _value.imageVisitor
          : imageVisitor // ignore: cast_nullable_to_non_nullable
              as String?,
      audioSdmsId: freezed == audioSdmsId
          ? _value.audioSdmsId
          : audioSdmsId // ignore: cast_nullable_to_non_nullable
              as String?,
      audioVisitor: freezed == audioVisitor
          ? _value.audioVisitor
          : audioVisitor // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraStatus: null == cameraStatus
          ? _value.cameraStatus
          : cameraStatus // ignore: cast_nullable_to_non_nullable
              as CameraStatus,
      audioStatus: null == audioStatus
          ? _value.audioStatus
          : audioStatus // ignore: cast_nullable_to_non_nullable
              as AudioStatus,
      requestType: null == requestType
          ? _value.requestType
          : requestType // ignore: cast_nullable_to_non_nullable
              as RequestType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HardwareStateCopyWith<$Res>
    implements $HardwareStateCopyWith<$Res> {
  factory _$$_HardwareStateCopyWith(
          _$_HardwareState value, $Res Function(_$_HardwareState) then) =
      __$$_HardwareStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CameraController? controller,
      String? imageSdmsId,
      String? imageVisitor,
      String? audioSdmsId,
      String? audioVisitor,
      String? image,
      String? error,
      CameraStatus cameraStatus,
      AudioStatus audioStatus,
      RequestType requestType});
}

/// @nodoc
class __$$_HardwareStateCopyWithImpl<$Res>
    extends _$HardwareStateCopyWithImpl<$Res, _$_HardwareState>
    implements _$$_HardwareStateCopyWith<$Res> {
  __$$_HardwareStateCopyWithImpl(
      _$_HardwareState _value, $Res Function(_$_HardwareState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? imageSdmsId = freezed,
    Object? imageVisitor = freezed,
    Object? audioSdmsId = freezed,
    Object? audioVisitor = freezed,
    Object? image = freezed,
    Object? error = freezed,
    Object? cameraStatus = null,
    Object? audioStatus = null,
    Object? requestType = null,
  }) {
    return _then(_$_HardwareState(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      imageSdmsId: freezed == imageSdmsId
          ? _value.imageSdmsId
          : imageSdmsId // ignore: cast_nullable_to_non_nullable
              as String?,
      imageVisitor: freezed == imageVisitor
          ? _value.imageVisitor
          : imageVisitor // ignore: cast_nullable_to_non_nullable
              as String?,
      audioSdmsId: freezed == audioSdmsId
          ? _value.audioSdmsId
          : audioSdmsId // ignore: cast_nullable_to_non_nullable
              as String?,
      audioVisitor: freezed == audioVisitor
          ? _value.audioVisitor
          : audioVisitor // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraStatus: null == cameraStatus
          ? _value.cameraStatus
          : cameraStatus // ignore: cast_nullable_to_non_nullable
              as CameraStatus,
      audioStatus: null == audioStatus
          ? _value.audioStatus
          : audioStatus // ignore: cast_nullable_to_non_nullable
              as AudioStatus,
      requestType: null == requestType
          ? _value.requestType
          : requestType // ignore: cast_nullable_to_non_nullable
              as RequestType,
    ));
  }
}

/// @nodoc

class _$_HardwareState implements _HardwareState {
  const _$_HardwareState(
      {this.controller,
      this.imageSdmsId,
      this.imageVisitor,
      this.audioSdmsId,
      this.audioVisitor,
      this.image,
      this.error,
      this.cameraStatus = CameraStatus.initial,
      this.audioStatus = AudioStatus.initial,
      this.requestType = RequestType.image});

  /// The controller needed to take pictures
  @override
  final CameraController? controller;

  /// The ID of the DE1-SoC associated with the most recent image request.
  @override
  final String? imageSdmsId;

  /// The ID of the visitor associated with the most recent image request.
  @override
  final String? imageVisitor;

  /// The ID of the DE1-SoC associated with the most recent audio request.
  @override
  final String? audioSdmsId;

  /// The ID of the visitor associated with the most recent audio request.
  @override
  final String? audioVisitor;

  /// The base64 representation of the most recent image captured by the Hardware.
  @override
  final String? image;

  /// The error message to display when data is unable to be fetched from
  /// the server.
  @override
  final String? error;

  /// Used to determine the state of the Hardware UI to show to the visitor.
  @override
  @JsonKey()
  final CameraStatus cameraStatus;

  /// Used to determine the state of the Hardware UI to show to the visitor.
  @override
  @JsonKey()
  final AudioStatus audioStatus;

  /// Used to determine which screen to show the visitor
  @override
  @JsonKey()
  final RequestType requestType;

  @override
  String toString() {
    return 'HardwareState(controller: $controller, imageSdmsId: $imageSdmsId, imageVisitor: $imageVisitor, audioSdmsId: $audioSdmsId, audioVisitor: $audioVisitor, image: $image, error: $error, cameraStatus: $cameraStatus, audioStatus: $audioStatus, requestType: $requestType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HardwareState &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.imageSdmsId, imageSdmsId) ||
                other.imageSdmsId == imageSdmsId) &&
            (identical(other.imageVisitor, imageVisitor) ||
                other.imageVisitor == imageVisitor) &&
            (identical(other.audioSdmsId, audioSdmsId) ||
                other.audioSdmsId == audioSdmsId) &&
            (identical(other.audioVisitor, audioVisitor) ||
                other.audioVisitor == audioVisitor) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.cameraStatus, cameraStatus) ||
                other.cameraStatus == cameraStatus) &&
            (identical(other.audioStatus, audioStatus) ||
                other.audioStatus == audioStatus) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      controller,
      imageSdmsId,
      imageVisitor,
      audioSdmsId,
      audioVisitor,
      image,
      error,
      cameraStatus,
      audioStatus,
      requestType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HardwareStateCopyWith<_$_HardwareState> get copyWith =>
      __$$_HardwareStateCopyWithImpl<_$_HardwareState>(this, _$identity);
}

abstract class _HardwareState implements HardwareState {
  const factory _HardwareState(
      {final CameraController? controller,
      final String? imageSdmsId,
      final String? imageVisitor,
      final String? audioSdmsId,
      final String? audioVisitor,
      final String? image,
      final String? error,
      final CameraStatus cameraStatus,
      final AudioStatus audioStatus,
      final RequestType requestType}) = _$_HardwareState;

  @override

  /// The controller needed to take pictures
  CameraController? get controller;
  @override

  /// The ID of the DE1-SoC associated with the most recent image request.
  String? get imageSdmsId;
  @override

  /// The ID of the visitor associated with the most recent image request.
  String? get imageVisitor;
  @override

  /// The ID of the DE1-SoC associated with the most recent audio request.
  String? get audioSdmsId;
  @override

  /// The ID of the visitor associated with the most recent audio request.
  String? get audioVisitor;
  @override

  /// The base64 representation of the most recent image captured by the Hardware.
  String? get image;
  @override

  /// The error message to display when data is unable to be fetched from
  /// the server.
  String? get error;
  @override

  /// Used to determine the state of the Hardware UI to show to the visitor.
  CameraStatus get cameraStatus;
  @override

  /// Used to determine the state of the Hardware UI to show to the visitor.
  AudioStatus get audioStatus;
  @override

  /// Used to determine which screen to show the visitor
  RequestType get requestType;
  @override
  @JsonKey(ignore: true)
  _$$_HardwareStateCopyWith<_$_HardwareState> get copyWith =>
      throw _privateConstructorUsedError;
}
