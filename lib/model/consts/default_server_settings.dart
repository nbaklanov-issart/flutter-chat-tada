import 'package:tada_chat/model/server_data/server_settings.dart';

const int maxMessageLength = 10500;
const int maxUsernameLength = 50;
const int maxRoomNameLength = 50;
const double defaultUpTime = 0;

const ServerSettings defaultSettings = ServerSettings(
  maxMessageLength,
  maxRoomNameLength,
  maxUsernameLength,
  defaultUpTime
);