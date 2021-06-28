import 'dart:convert';

import 'package:tada_chat/datasources/server_info_data_source.dart';
import 'package:tada_chat/model/consts/default_server_settings.dart';
import 'package:tada_chat/model/enum/response_type.dart';
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

  ServerInfoReponse<ServerSettings> _parseServerSettings(String json) {
    ServerSettings settings;
    ResponseType type;
    try {
      Map<String, dynamic> parsed = jsonDecode(json);
      settings = ServerSettings.fromJson(parsed[resultFieldName]);
      type = ResponseType.success;
    } catch(error) {
      settings = defaultSettings;
      type = ResponseType.error;
    }
    return ServerInfoReponse(settings, type);
  }
}