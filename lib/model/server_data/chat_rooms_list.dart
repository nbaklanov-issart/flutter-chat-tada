
import 'package:json_annotation/json_annotation.dart';
import 'package:tada_chat/model/server_data/chat_room.dart';


part 'chat_rooms_list.g.dart';

@JsonSerializable()
class ChatRoomsList {
  final List<ChatRoom> result;

  const ChatRoomsList(this.result);

  factory ChatRoomsList.fromJson(Map<String, dynamic> json) => _$ChatRoomsListFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomsListToJson(this);
} 