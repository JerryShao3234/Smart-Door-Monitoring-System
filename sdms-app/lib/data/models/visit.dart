// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:sdms_app/data/models/message.dart';

part 'visit.freezed.dart';
part 'visit.g.dart';

@freezed
class Visit with _$Visit {
  const Visit._();

  const factory Visit({
    /// The unique id associated with this visit.
    @JsonKey(name: '_id') required String id,

    /// An identification for the visitor of this visit
    @JsonKey(name: 'visitor') required String visitor,

    /// The date and time of the visit in milliseconds since epoch.
    @JsonKey(name: 'date') required int date,

    /// The first message sent by the visitor upon initial interaction
    /// with the SDMS.
    @JsonKey(name: 'intent') required String intent,

    /// A base64 String representing the image of the visitor
    /// that was taken by the SDMS.
    @JsonKey(name: 'img') required String image,

    /// The list of messages sent/received to/from the user that
    /// relate to this particular visit.
    @JsonKey(name: 'messages') required List<Message> messages,
  }) = _Visit;

  factory Visit.fromJson(Map<String, dynamic> json) => _$VisitFromJson(json);
}
