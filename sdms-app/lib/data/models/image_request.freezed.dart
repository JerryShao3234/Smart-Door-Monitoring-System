// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageRequest _$ImageRequestFromJson(Map<String, dynamic> json) {
  return _ImageRequest.fromJson(json);
}

/// @nodoc
mixin _$ImageRequest {
  /// The ID of the SDMS that the image request is associated with.
  @JsonKey(name: 'de1socID')
  String get sdmsId => throw _privateConstructorUsedError;

  /// An identification for the visitor of this visit
  @JsonKey(name: 'visitor')
  String get visitor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageRequestCopyWith<ImageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageRequestCopyWith<$Res> {
  factory $ImageRequestCopyWith(
          ImageRequest value, $Res Function(ImageRequest) then) =
      _$ImageRequestCopyWithImpl<$Res, ImageRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'de1socID') String sdmsId,
      @JsonKey(name: 'visitor') String visitor});
}

/// @nodoc
class _$ImageRequestCopyWithImpl<$Res, $Val extends ImageRequest>
    implements $ImageRequestCopyWith<$Res> {
  _$ImageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sdmsId = null,
    Object? visitor = null,
  }) {
    return _then(_value.copyWith(
      sdmsId: null == sdmsId
          ? _value.sdmsId
          : sdmsId // ignore: cast_nullable_to_non_nullable
              as String,
      visitor: null == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageRequestCopyWith<$Res>
    implements $ImageRequestCopyWith<$Res> {
  factory _$$_ImageRequestCopyWith(
          _$_ImageRequest value, $Res Function(_$_ImageRequest) then) =
      __$$_ImageRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'de1socID') String sdmsId,
      @JsonKey(name: 'visitor') String visitor});
}

/// @nodoc
class __$$_ImageRequestCopyWithImpl<$Res>
    extends _$ImageRequestCopyWithImpl<$Res, _$_ImageRequest>
    implements _$$_ImageRequestCopyWith<$Res> {
  __$$_ImageRequestCopyWithImpl(
      _$_ImageRequest _value, $Res Function(_$_ImageRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sdmsId = null,
    Object? visitor = null,
  }) {
    return _then(_$_ImageRequest(
      sdmsId: null == sdmsId
          ? _value.sdmsId
          : sdmsId // ignore: cast_nullable_to_non_nullable
              as String,
      visitor: null == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageRequest extends _ImageRequest {
  _$_ImageRequest(
      {@JsonKey(name: 'de1socID') required this.sdmsId,
      @JsonKey(name: 'visitor') required this.visitor})
      : super._();

  factory _$_ImageRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ImageRequestFromJson(json);

  /// The ID of the SDMS that the image request is associated with.
  @override
  @JsonKey(name: 'de1socID')
  final String sdmsId;

  /// An identification for the visitor of this visit
  @override
  @JsonKey(name: 'visitor')
  final String visitor;

  @override
  String toString() {
    return 'ImageRequest(sdmsId: $sdmsId, visitor: $visitor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageRequest &&
            (identical(other.sdmsId, sdmsId) || other.sdmsId == sdmsId) &&
            (identical(other.visitor, visitor) || other.visitor == visitor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sdmsId, visitor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageRequestCopyWith<_$_ImageRequest> get copyWith =>
      __$$_ImageRequestCopyWithImpl<_$_ImageRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageRequestToJson(
      this,
    );
  }
}

abstract class _ImageRequest extends ImageRequest {
  factory _ImageRequest(
          {@JsonKey(name: 'de1socID') required final String sdmsId,
          @JsonKey(name: 'visitor') required final String visitor}) =
      _$_ImageRequest;
  _ImageRequest._() : super._();

  factory _ImageRequest.fromJson(Map<String, dynamic> json) =
      _$_ImageRequest.fromJson;

  @override

  /// The ID of the SDMS that the image request is associated with.
  @JsonKey(name: 'de1socID')
  String get sdmsId;
  @override

  /// An identification for the visitor of this visit
  @JsonKey(name: 'visitor')
  String get visitor;
  @override
  @JsonKey(ignore: true)
  _$$_ImageRequestCopyWith<_$_ImageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
