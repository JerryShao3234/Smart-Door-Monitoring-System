// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_request.freezed.dart';
part 'audio_request.g.dart';

@freezed
class AudioRequest with _$AudioRequest {
  AudioRequest._();

  factory AudioRequest({
    /// The ID of the SDMS that the audio request is associated with.
    @JsonKey(name: 'de1socID') required String sdmsId,

    /// An identification for the visitor of this visit
    @JsonKey(name: 'visitor') required String visitor,
  }) = _AudioRequest;

  factory AudioRequest.fromJson(Map<String, dynamic> json) =>
      _$AudioRequestFromJson(json);
}
