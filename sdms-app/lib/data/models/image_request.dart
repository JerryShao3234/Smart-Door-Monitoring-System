// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_request.freezed.dart';
part 'image_request.g.dart';

@freezed
class ImageRequest with _$ImageRequest {
  ImageRequest._();

  factory ImageRequest({
    /// The ID of the SDMS that the image request is associated with.
    @JsonKey(name: 'de1socID') required String sdmsId,

    /// An identification for the visitor of this visit
    @JsonKey(name: 'visitor') required String visitor,
  }) = _ImageRequest;

  factory ImageRequest.fromJson(Map<String, dynamic> json) =>
      _$ImageRequestFromJson(json);
}
