import 'dart:convert';

import 'package:tada_chat/datasources/server_info_data_source.dart';
import 'package:tada_chat/model/consts/default_server_settings.dart';
import 'package:tada_chat/model/enum/response_type.dart';
import 'package:tada_chat/model/server_data/message_history.dart';
import 'package:tada_chat/model/server_data/server_settings.dart';
import 'package:tada_chat/model/server_info_response.dart';

class ServerInfoRepository {
  static const String resultFieldName = "result";

  final ServerInfoDataSource _serverInfoDataSource;

  ServerInfoRepository(
    this._serverInfoDataSource
  );

  Future<ServerInfoReponse<ServerSettings>> getServerSettings() async {
    ServerInfoReponse<String> response = await _serverInfoDataSource.getServerSettings();
    return response.type == ResponseType.success
      ? _parseServerSettings(response.message)
      : ServerInfoReponse(defaultSettings, ResponseType.error);    
  }

  Future<ServerInfoReponse<MessageHistory>> getRoomHistory(String roomName) async {
    ServerInfoReponse<String> response = await _serverInfoDataSource.getMessagesHistory(roomName);
    return response.type == ResponseType.success
      ? _parseHistory(response.message)
      : ServerInfoReponse(MessageHistory(List.empty()), ResponseType.error);    
  }

  ServerInfoReponse<MessageHistory> _parseHistory(String json) {
    MessageHistory history;
    ResponseType type;
    try {
      Map<String, dynamic> parsed = jsonDecode(json);
      history = MessageHistory.fromJson(parsed);
      type = ResponseType.success;
    } on TypeError {      
      history = MessageHistory(List.empty());
      type = ResponseType.error;
    }
    return ServerInfoReponse(history, type);
  }

  ServerInfoReponse<ServerSettings> _parseServerSettings(String json) {
    ServerSettings settings;
    ResponseType type;
    try {
      Map<String, dynamic> parsed = jsonDecode(json);
      settings = ServerSettings.fromJson(parsed[resultFieldName]);
      type = ResponseType.success;
    } on TypeError {
      settings = defaultSettings;
      type = ResponseType.error;
    }
    return ServerInfoReponse(settings, type);
  }
}