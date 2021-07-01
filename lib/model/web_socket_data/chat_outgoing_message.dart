import 'package:json_annotation/json_annotation.dart';

part 'chat_outgoing_message.g.dart';

@JsonSerializable()
class ChatOutgoingMessage {
  final String room;
  final String text;
  final String id;

  const ChatOutgoingMessage(
    this.room,
    this.text,
    this.id
  );

  factory ChatOutgoingMessage.fromJson(Map<String, dynamic> json) => _$ChatOutgoingMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatOutgoingMessageToJson(this);
} 