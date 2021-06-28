import 'package:json_annotation/json_annotation.dart';

part 'server_settings.g.dart';

@JsonSerializable()
class ServerSettings {

  @JsonKey(name: "max_message_length")
  final int maxMessageLength;

  @JsonKey(name: "max_room_title_length")
  final int maxRoomTitleLength;

  @JsonKey(name: "max_username_length")
  final int maxUsernameLength;
  
  final double uptime;

  const ServerSettings(
    this.maxMessageLength,
    this.maxRoomTitleLength,
    this.maxUsernameLength,
    this.uptime
  );

  factory ServerSettings.fromJson(Map<String, dynamic> json) => _$ServerSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ServerSettingsToJson(this);
} 