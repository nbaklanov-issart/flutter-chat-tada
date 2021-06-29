import 'package:tada_chat/model/server_data/message_history.dart';
import 'package:tada_chat/model/server_info_response.dart';

abstract class ServerInfoDataSource {
  Future<ServerInfoReponse<String>> getServerSettings();
  Future<ServerInfoReponse<String>> getMessagesHistory(String roomName);

}