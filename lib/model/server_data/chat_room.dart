
import 'package:json_annotation/json_annotation.dart';
import 'package:tada_chat/model/server_data/chat_message.dart';

part 'chat_room.g.dart';

@JsonSerializable()
class ChatRoom {
  final String name;

  @JsonKey(name: "last_message")
  final ChatMessage lastMessage;

  const ChatRoom(
    this.name,
    this.lastMessage
  );

  factory ChatRoom.fromJson(Map<String, dynamic> json) => _$ChatRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomToJson(this);
} 