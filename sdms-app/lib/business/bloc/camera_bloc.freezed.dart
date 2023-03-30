// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CameraEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CameraController controller) setupComplete,
    required TResult Function(ImageRequest imageRequest) requestReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CameraController controller)? setupComplete,
    TResult? Function(ImageRequest imageRequest)? requestReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CameraController controller)? setupComplete,
    TResult Function(ImageRequest imageRequest)? requestReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraSetupComplete value) setupComplete,
    required TResult Function(CameraRequestReceived value) requestReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraSetupComplete value)? setupComplete,
    TResult? Function(CameraRequestReceived value)? requestReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraSetupComplete value)? setupComplete,
    TResult Function(CameraRequestReceived value)? requestReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraEventCopyWith<$Res> {
  factory $CameraEventCopyWith(
          CameraEvent value, $Res Function(CameraEvent) then) =
      _$CameraEventCopyWithImpl<$Res, CameraEvent>;
}

/// @nodoc
class _$CameraEventCopyWithImpl<$Res, $Val extends CameraEvent>
    implements $CameraEventCopyWith<$Res> {
  _$CameraEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CameraSetupCompleteCopyWith<$Res> {
  factory _$$CameraSetupCompleteCopyWith(_$CameraSetupComplete value,
          $Res Function(_$CameraSetupComplete) then) =
      __$$CameraSetupCompleteCopyWithImpl<$Res>;
  @useResult
  $Res call({CameraController controller});
}

/// @nodoc
class __$$CameraSetupCompleteCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res, _$CameraSetupComplete>
    implements _$$CameraSetupCompleteCopyWith<$Res> {
  __$$CameraSetupCompleteCopyWithImpl(
      _$CameraSetupComplete _value, $Res Function(_$CameraSetupComplete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
  }) {
    return _then(_$CameraSetupComplete(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController,
    ));
  }
}

/// @nodoc

class _$CameraSetupComplete implements CameraSetupComplete {
  const _$CameraSetupComplete({required this.controller});

  @override
  final CameraController controller;

  @override
  String toString() {
    return 'CameraEvent.setupComplete(controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraSetupComplete &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraSetupCompleteCopyWith<_$CameraSetupComplete> get copyWith =>
      __$$CameraSetupCompleteCopyWithImpl<_$CameraSetupComplete>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CameraController controller) setupComplete,
    required TResult Function(ImageRequest imageRequest) requestReceived,
  }) {
    return setupComplete(controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CameraController controller)? setupComplete,
    TResult? Function(ImageRequest imageRequest)? requestReceived,
  }) {
    return setupComplete?.call(controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CameraController controller)? setupComplete,
    TResult Function(ImageRequest imageRequest)? requestReceived,
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
    required TResult Function(CameraSetupComplete value) setupComplete,
    required TResult Function(CameraRequestReceived value) requestReceived,
  }) {
    return setupComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraSetupComplete value)? setupComplete,
    TResult? Function(CameraRequestReceived value)? requestReceived,
  }) {
    return setupComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraSetupComplete value)? setupComplete,
    TResult Function(CameraRequestReceived value)? requestReceived,
    required TResult orElse(),
  }) {
    if (setupComplete != null) {
      return setupComplete(this);
    }
    return orElse();
  }
}

abstract class CameraSetupComplete implements CameraEvent {
  const factory CameraSetupComplete(
      {required final CameraController controller}) = _$CameraSetupComplete;

  CameraController get controller;
  @JsonKey(ignore: true)
  _$$CameraSetupCompleteCopyWith<_$CameraSetupComplete> get copyWith =>
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
    extends _$CameraEventCopyWithImpl<$Res, _$CameraRequestReceived>
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
    return 'CameraEvent.requestReceived(imageRequest: $imageRequest)';
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
    required TResult Function(ImageRequest imageRequest) requestReceived,
  }) {
    return requestReceived(imageRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CameraController controller)? setupComplete,
    TResult? Function(ImageRequest imageRequest)? requestReceived,
  }) {
    return requestReceived?.call(imageRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CameraController controller)? setupComplete,
    TResult Function(ImageRequest imageRequest)? requestReceived,
    required TResult orElse(),
  }) {
    if (requestReceived != null) {
      return requestReceived(imageRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CameraSetupComplete value) setupComplete,
    required TResult Function(CameraRequestReceived value) requestReceived,
  }) {
    return requestReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CameraSetupComplete value)? setupComplete,
    TResult? Function(CameraRequestReceived value)? requestReceived,
  }) {
    return requestReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CameraSetupComplete value)? setupComplete,
    TResult Function(CameraRequestReceived value)? requestReceived,
    required TResult orElse(),
  }) {
    if (requestReceived != null) {
      return requestReceived(this);
    }
    return orElse();
  }
}

abstract class CameraRequestReceived implements CameraEvent {
  const factory CameraRequestReceived(
      {required final ImageRequest imageRequest}) = _$CameraRequestReceived;

  ImageRequest get imageRequest;
  @JsonKey(ignore: true)
  _$$CameraRequestReceivedCopyWith<_$CameraRequestReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CameraState {
  /// The controller needed to take pictures
  CameraController? get controller => throw _privateConstructorUsedError;

  /// The ID of the DE1-SoC associated with the most recent image request.
  String? get sdmsId => throw _privateConstructorUsedError;

  /// The ID of the visitor associated with the most recent image request.
  String? get visitor => throw _privateConstructorUsedError;

  /// The base64 representation of the most recent image captured by the camera.
  String? get image => throw _privateConstructorUsedError;

  /// The error message to display when data is unable to be fetched from
  /// the server.
  String? get error => throw _privateConstructorUsedError;

  /// Used to determine the state of the camera UI to show to the user.
  CameraStatus get cameraStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraStateCopyWith<CameraState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraStateCopyWith<$Res> {
  factory $CameraStateCopyWith(
          CameraState value, $Res Function(CameraState) then) =
      _$CameraStateCopyWithImpl<$Res, CameraState>;
  @useResult
  $Res call(
      {CameraController? controller,
      String? sdmsId,
      String? visitor,
      String? image,
      String? error,
      CameraStatus cameraStatus});
}

/// @nodoc
class _$CameraStateCopyWithImpl<$Res, $Val extends CameraState>
    implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? sdmsId = freezed,
    Object? visitor = freezed,
    Object? image = freezed,
    Object? error = freezed,
    Object? cameraStatus = null,
  }) {
    return _then(_value.copyWith(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      sdmsId: freezed == sdmsId
          ? _value.sdmsId
          : sdmsId // ignore: cast_nullable_to_non_nullable
              as String?,
      visitor: freezed == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CameraStateCopyWith<$Res>
    implements $CameraStateCopyWith<$Res> {
  factory _$$_CameraStateCopyWith(
          _$_CameraState value, $Res Function(_$_CameraState) then) =
      __$$_CameraStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CameraController? controller,
      String? sdmsId,
      String? visitor,
      String? image,
      String? error,
      CameraStatus cameraStatus});
}

/// @nodoc
class __$$_CameraStateCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res, _$_CameraState>
    implements _$$_CameraStateCopyWith<$Res> {
  __$$_CameraStateCopyWithImpl(
      _$_CameraState _value, $Res Function(_$_CameraState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? sdmsId = freezed,
    Object? visitor = freezed,
    Object? image = freezed,
    Object? error = freezed,
    Object? cameraStatus = null,
  }) {
    return _then(_$_CameraState(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      sdmsId: freezed == sdmsId
          ? _value.sdmsId
          : sdmsId // ignore: cast_nullable_to_non_nullable
              as String?,
      visitor: freezed == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

class _$_CameraState implements _CameraState {
  const _$_CameraState(
      {this.controller,
      this.sdmsId,
      this.visitor,
      this.image,
      this.error,
      this.cameraStatus = CameraStatus.initial});

  /// The controller needed to take pictures
  @override
  final CameraController? controller;

  /// The ID of the DE1-SoC associated with the most recent image request.
  @override
  final String? sdmsId;

  /// The ID of the visitor associated with the most recent image request.
  @override
  final String? visitor;

  /// The base64 representation of the most recent image captured by the camera.
  @override
  final String? image;

  /// The error message to display when data is unable to be fetched from
  /// the server.
  @override
  final String? error;

  /// Used to determine the state of the camera UI to show to the user.
  @override
  @JsonKey()
  final CameraStatus cameraStatus;

  @override
  String toString() {
    return 'CameraState(controller: $controller, sdmsId: $sdmsId, visitor: $visitor, image: $image, error: $error, cameraStatus: $cameraStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CameraState &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.sdmsId, sdmsId) || other.sdmsId == sdmsId) &&
            (identical(other.visitor, visitor) || other.visitor == visitor) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.cameraStatus, cameraStatus) ||
                other.cameraStatus == cameraStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, controller, sdmsId, visitor, image, error, cameraStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CameraStateCopyWith<_$_CameraState> get copyWith =>
      __$$_CameraStateCopyWithImpl<_$_CameraState>(this, _$identity);
}

abstract class _CameraState implements CameraState {
  const factory _CameraState(
      {final CameraController? controller,
      final String? sdmsId,
      final String? visitor,
      final String? image,
      final String? error,
      final CameraStatus cameraStatus}) = _$_CameraState;

  @override

  /// The controller needed to take pictures
  CameraController? get controller;
  @override

  /// The ID of the DE1-SoC associated with the most recent image request.
  String? get sdmsId;
  @override

  /// The ID of the visitor associated with the most recent image request.
  String? get visitor;
  @override

  /// The base64 representation of the most recent image captured by the camera.
  String? get image;
  @override

  /// The error message to display when data is unable to be fetched from
  /// the server.
  String? get error;
  @override

  /// Used to determine the state of the camera UI to show to the user.
  CameraStatus get cameraStatus;
  @override
  @JsonKey(ignore: true)
  _$$_CameraStateCopyWith<_$_CameraState> get copyWith =>
      throw _privateConstructorUsedError;
}
