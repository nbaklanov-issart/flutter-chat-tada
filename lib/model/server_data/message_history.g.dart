// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageHistory _$MessageHistoryFromJson(Map<String, dynamic> json) {
  return MessageHistory(
    (json['result'] as List<dynamic>)
        .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MessageHistoryToJson(MessageHistory instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
