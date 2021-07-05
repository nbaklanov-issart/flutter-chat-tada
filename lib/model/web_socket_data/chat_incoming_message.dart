import 'package:json_annotation/json_annotation.dart';
import 'package:tada_chat/model/server_data/user.dart';

part 'chat_incoming_message.g.dart';

@JsonSerializable()
class ChatIncomingMessage {
  final String room;
  final String text;
  final String? id;
  final String created;
  final User sender;

  const ChatIncomingMessage(
    this.room,
    this.text,
    this.id,
    this.created,
    this.sender
  );

  factory ChatIncomingMessage.fromJson(Map<String, dynamic> json) => _$ChatIncomingMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatIncomingMessageToJson(this);
} 