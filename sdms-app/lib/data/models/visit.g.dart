// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Visit _$$_VisitFromJson(Map<String, dynamic> json) => _$_Visit(
      id: json['_id'] as String,
      visitor: json['visitor'] as String,
      date: json['date'] as int,
      intent: json['intent'] as String,
      image: json['img'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VisitToJson(_$_Visit instance) => <String, dynamic>{
      '_id': instance.id,
      'visitor': instance.visitor,
      'date': instance.date,
      'intent': instance.intent,
      'img': instance.image,
      'messages': instance.messages,
    };
