
import 'package:json_annotation/json_annotation.dart';
import 'package:tada_chat/model/server_data/chat_message.dart';

part 'message_history.g.dart';

@JsonSerializable()
class MessageHistory {
  final List<ChatMessage> result;

  const MessageHistory(this.result);

  factory MessageHistory.fromJson(Map<String, dynamic> json) => _$MessageHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$MessageHistoryToJson(this);
} 