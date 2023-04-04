// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Visit _$VisitFromJson(Map<String, dynamic> json) {
  return _Visit.fromJson(json);
}

/// @nodoc
mixin _$Visit {
  /// The unique id associated with this visit.
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;

  /// An identification for the visitor of this visit
  @JsonKey(name: 'visitor')
  String get visitor => throw _privateConstructorUsedError;

  /// The date and time of the visit in milliseconds since epoch.
  @JsonKey(name: 'date')
  int get date => throw _privateConstructorUsedError;

  /// The first message sent by the visitor upon initial interaction
  /// with the SDMS.
  @JsonKey(name: 'intent')
  String get intent => throw _privateConstructorUsedError;

  /// A base64 String representing the image of the visitor
  /// that was taken by the SDMS.
  @JsonKey(name: 'img')
  String get image => throw _privateConstructorUsedError;

  /// The list of messages sent/received to/from the user that
  /// relate to this particular visit.
  @JsonKey(name: 'messages')
  List<Message> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitCopyWith<Visit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitCopyWith<$Res> {
  factory $VisitCopyWith(Visit value, $Res Function(Visit) then) =
      _$VisitCopyWithImpl<$Res, Visit>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'visitor') String visitor,
      @JsonKey(name: 'date') int date,
      @JsonKey(name: 'intent') String intent,
      @JsonKey(name: 'img') String image,
      @JsonKey(name: 'messages') List<Message> messages});
}

/// @nodoc
class _$VisitCopyWithImpl<$Res, $Val extends Visit>
    implements $VisitCopyWith<$Res> {
  _$VisitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? visitor = null,
    Object? date = null,
    Object? intent = null,
    Object? image = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      visitor: null == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      intent: null == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VisitCopyWith<$Res> implements $VisitCopyWith<$Res> {
  factory _$$_VisitCopyWith(_$_Visit value, $Res Function(_$_Visit) then) =
      __$$_VisitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'visitor') String visitor,
      @JsonKey(name: 'date') int date,
      @JsonKey(name: 'intent') String intent,
      @JsonKey(name: 'img') String image,
      @JsonKey(name: 'messages') List<Message> messages});
}

/// @nodoc
class __$$_VisitCopyWithImpl<$Res> extends _$VisitCopyWithImpl<$Res, _$_Visit>
    implements _$$_VisitCopyWith<$Res> {
  __$$_VisitCopyWithImpl(_$_Visit _value, $Res Function(_$_Visit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? visitor = null,
    Object? date = null,
    Object? intent = null,
    Object? image = null,
    Object? messages = null,
  }) {
    return _then(_$_Visit(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      visitor: null == visitor
          ? _value.visitor
          : visitor // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      intent: null == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Visit extends _Visit {
  const _$_Visit(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'visitor') required this.visitor,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'intent') required this.intent,
      @JsonKey(name: 'img') required this.image,
      @JsonKey(name: 'messages') required final List<Message> messages})
      : _messages = messages,
        super._();

  factory _$_Visit.fromJson(Map<String, dynamic> json) =>
      _$$_VisitFromJson(json);

  /// The unique id associated with this visit.
  @override
  @JsonKey(name: '_id')
  final String id;

  /// An identification for the visitor of this visit
  @override
  @JsonKey(name: 'visitor')
  final String visitor;

  /// The date and time of the visit in milliseconds since epoch.
  @override
  @JsonKey(name: 'date')
  final int date;

  /// The first message sent by the visitor upon initial interaction
  /// with the SDMS.
  @override
  @JsonKey(name: 'intent')
  final String intent;

  /// A base64 String representing the image of the visitor
  /// that was taken by the SDMS.
  @override
  @JsonKey(name: 'img')
  final String image;

  /// The list of messages sent/received to/from the user that
  /// relate to this particular visit.
  final List<Message> _messages;

  /// The list of messages sent/received to/from the user that
  /// relate to this particular visit.
  @override
  @JsonKey(name: 'messages')
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'Visit(id: $id, visitor: $visitor, date: $date, intent: $intent, image: $image, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Visit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.visitor, visitor) || other.visitor == visitor) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.intent, intent) || other.intent == intent) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, visitor, date, intent, image,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisitCopyWith<_$_Visit> get copyWith =>
      __$$_VisitCopyWithImpl<_$_Visit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitToJson(
      this,
    );
  }
}

abstract class _Visit extends Visit {
  const factory _Visit(
          {@JsonKey(name: '_id') required final String id,
          @JsonKey(name: 'visitor') required final String visitor,
          @JsonKey(name: 'date') required final int date,
          @JsonKey(name: 'intent') required final String intent,
          @JsonKey(name: 'img') required final String image,
          @JsonKey(name: 'messages') required final List<Message> messages}) =
      _$_Visit;
  const _Visit._() : super._();

  factory _Visit.fromJson(Map<String, dynamic> json) = _$_Visit.fromJson;

  @override

  /// The unique id associated with this visit.
  @JsonKey(name: '_id')
  String get id;
  @override

  /// An identification for the visitor of this visit
  @JsonKey(name: 'visitor')
  String get visitor;
  @override

  /// The date and time of the visit in milliseconds since epoch.
  @JsonKey(name: 'date')
  int get date;
  @override

  /// The first message sent by the visitor upon initial interaction
  /// with the SDMS.
  @JsonKey(name: 'intent')
  String get intent;
  @override

  /// A base64 String representing the image of the visitor
  /// that was taken by the SDMS.
  @JsonKey(name: 'img')
  String get image;
  @override

  /// The list of messages sent/received to/from the user that
  /// relate to this particular visit.
  @JsonKey(name: 'messages')
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_VisitCopyWith<_$_Visit> get copyWith =>
      throw _privateConstructorUsedError;
}
