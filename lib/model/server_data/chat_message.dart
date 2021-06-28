import 'package:json_annotation/json_annotation.dart';
import 'package:tada_chat/model/server_data/user.dart';


part 'chat_message.g.dart';

@JsonSerializable()
class ChatMessage {
  final String text;
  final String room;  
  final String created;
  final User sender;

  const ChatMessage(
    this.text,
    this.room,
    this.created,
    this.sender
  );

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
} 