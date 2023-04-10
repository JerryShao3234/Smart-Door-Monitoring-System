// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      id: json['_id'] as String,
      userId: json['userID'] as String,
      body: json['messageInfo'] as String?,
      receivedAt: json['date'] as int,
      sender: json['sender'] as String,
      markedAsRead: json['read'] as bool,
      visitId: json['visitID'] as String,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userID': instance.userId,
      'messageInfo': instance.body,
      'date': instance.receivedAt,
      'sender': instance.sender,
      'read': instance.markedAsRead,
      'visitID': instance.visitId,
    };
