import 'package:tada_chat/model/server_info_response.dart';

abstract class ServerInfoDataSource {
  Future<ServerInfoReponse<String>> getServerSettings();
}