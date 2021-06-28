// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerSettings _$ServerSettingsFromJson(Map<String, dynamic> json) {
  return ServerSettings(
    json['max_message_length'] as int,
    json['max_room_title_length'] as int,
    json['max_username_length'] as int,
    (json['uptime'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ServerSettingsToJson(ServerSettings instance) =>
    <String, dynamic>{
      'max_message_length': instance.maxMessageLength,
      'max_room_title_length': instance.maxRoomTitleLength,
      'max_username_length': instance.maxUsernameLength,
      'uptime': instance.uptime,
    };
