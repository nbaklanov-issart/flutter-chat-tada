// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_rooms_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomsList _$ChatRoomsListFromJson(Map<String, dynamic> json) {
  return ChatRoomsList(
    (json['result'] as List<dynamic>)
        .map((e) => ChatRoom.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ChatRoomsListToJson(ChatRoomsList instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
