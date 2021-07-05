// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_incoming_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatIncomingMessage _$ChatIncomingMessageFromJson(Map<String, dynamic> json) {
  return ChatIncomingMessage(
    json['room'] as String,
    json['text'] as String,
    json['id'] as String?,
    json['created'] as String,
    User.fromJson(json['sender'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChatIncomingMessageToJson(
        ChatIncomingMessage instance) =>
    <String, dynamic>{
      'room': instance.room,
      'text': instance.text,
      'id': instance.id,
      'created': instance.created,
      'sender': instance.sender,
    };
