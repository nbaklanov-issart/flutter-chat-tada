// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) {
  return ChatRoom(
    json['name'] as String,
    ChatMessage.fromJson(json['last_message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChatRoomToJson(ChatRoom instance) => <String, dynamic>{
      'name': instance.name,
      'last_message': instance.lastMessage,
    };
