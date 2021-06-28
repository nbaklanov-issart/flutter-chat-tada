// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return ChatMessage(
    json['text'] as String,
    json['room'] as String,
    json['created'] as String,
    User.fromJson(json['sender'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'text': instance.text,
      'room': instance.room,
      'created': instance.created,
      'sender': instance.sender,
    };
