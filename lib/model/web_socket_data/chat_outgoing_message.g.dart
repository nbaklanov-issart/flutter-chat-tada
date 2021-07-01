// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_outgoing_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatOutgoingMessage _$ChatOutgoingMessageFromJson(Map<String, dynamic> json) {
  return ChatOutgoingMessage(
    json['room'] as String,
    json['text'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$ChatOutgoingMessageToJson(
        ChatOutgoingMessage instance) =>
    <String, dynamic>{
      'room': instance.room,
      'text': instance.text,
      'id': instance.id,
    };
