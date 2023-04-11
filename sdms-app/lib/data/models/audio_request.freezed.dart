// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AudioRequest _$AudioRequestFromJson(Map<String, dynamic> json) {
  return _AudioRequest.fromJson(json);
}

/// @nodoc
mixin _$AudioRequest {
  /// The ID of the SDMS that the audio request is associated with.
  @JsonKey(name: 'de1socID')
  String get sdmsId => throw _privateConstructorUsedError;

  /// An identification for the visitor of this visit
  @JsonKey(name: 'visitor')
  String get visitor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioRequestCopyWith<AudioRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioRequestCopyWith<$Res> {
  factory $AudioRequestCopyWith(
          AudioRequest value, $Res Function(AudioRequest) then) =
      _$AudioRequestCopyWithImpl<$Res, AudioRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'de1socID') String sdmsId,
      @JsonKey(name: 'visitor') String visitor});
}

/// @nodoc
class _$AudioRequestCopyWithImpl<$Res, $Val extends AudioRequest>
    implements $AudioRequestCopyWith<$Res> {
  _$AudioRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$_AudioRequestCopyWith<$Res>
    implements $AudioRequestCopyWith<$Res> {
  factory _$$_AudioRequestCopyWith(
          _$_AudioRequest value, $Res Function(_$_AudioRequest) then) =
      __$$_AudioRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'de1socID') String sdmsId,
      @JsonKey(name: 'visitor') String visitor});
}

/// @nodoc
class __$$_AudioRequestCopyWithImpl<$Res>
    extends _$AudioRequestCopyWithImpl<$Res, _$_AudioRequest>
    implements _$$_AudioRequestCopyWith<$Res> {
  __$$_AudioRequestCopyWithImpl(
      _$_AudioRequest _value, $Res Function(_$_AudioRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sdmsId = null,
    Object? visitor = null,
  }) {
    return _then(_$_AudioRequest(
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
class _$_AudioRequest extends _AudioRequest {
  _$_AudioRequest(
      {@JsonKey(name: 'de1socID') required this.sdmsId,
      @JsonKey(name: 'visitor') required this.visitor})
      : super._();

  factory _$_AudioRequest.fromJson(Map<String, dynamic> json) =>
      _$$_AudioRequestFromJson(json);

  /// The ID of the SDMS that the audio request is associated with.
  @override
  @JsonKey(name: 'de1socID')
  final String sdmsId;

  /// An identification for the visitor of this visit
  @override
  @JsonKey(name: 'visitor')
  final String visitor;

  @override
  String toString() {
    return 'AudioRequest(sdmsId: $sdmsId, visitor: $visitor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioRequest &&
            (identical(other.sdmsId, sdmsId) || other.sdmsId == sdmsId) &&
            (identical(other.visitor, visitor) || other.visitor == visitor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sdmsId, visitor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioRequestCopyWith<_$_AudioRequest> get copyWith =>
      __$$_AudioRequestCopyWithImpl<_$_AudioRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AudioRequestToJson(
      this,
    );
  }
}

abstract class _AudioRequest extends AudioRequest {
  factory _AudioRequest(
          {@JsonKey(name: 'de1socID') required final String sdmsId,
          @JsonKey(name: 'visitor') required final String visitor}) =
      _$_AudioRequest;
  _AudioRequest._() : super._();

  factory _AudioRequest.fromJson(Map<String, dynamic> json) =
      _$_AudioRequest.fromJson;

  @override

  /// The ID of the SDMS that the audio request is associated with.
  @JsonKey(name: 'de1socID')
  String get sdmsId;
  @override

  /// An identification for the visitor of this visit
  @JsonKey(name: 'visitor')
  String get visitor;
  @override
  @JsonKey(ignore: true)
  _$$_AudioRequestCopyWith<_$_AudioRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
