import 'package:http/http.dart' as http;
import 'package:tada_chat/datasources/server_info_data_source.dart';
import 'package:tada_chat/model/enum/response_type.dart';
import 'package:tada_chat/model/server_data/message_history.dart';
import 'package:tada_chat/model/server_info_response.dart';

class HttpApiDataSource extends ServerInfoDataSource {
  static const String baseServerAddress = "https://nane.tada.team/api";
  static const int successStatus = 200;


  @override
  Future<ServerInfoReponse<String>> getServerSettings() async {
    try {      
      http.Response response = await http.get(Uri.parse("$baseServerAddress/settings"));
      return response.statusCode == successStatus
        ? ServerInfoReponse(response.body, ResponseType.success)
        : ServerInfoReponse(
            "Settings respose status : ${response.statusCode}",
            ResponseType.error
          );

    } catch(exception) {
      return ServerInfoReponse(
        "Exception during settings request",
        ResponseType.error
      );
    }
  }

  @override
  Future<ServerInfoReponse<String>> getMessagesHistory(String roomName) async {
    try {      
      http.Response response = await http.get(Uri.parse("$baseServerAddress/rooms/$roomName/history"));
      return response.statusCode == successStatus
        ? ServerInfoReponse(response.body, ResponseType.success)
        : ServerInfoReponse(
            "Settings respose status : ${response.statusCode}",
            ResponseType.error
          );
    } catch(exception) {
      return ServerInfoReponse(
        "Exception during room history request",
        ResponseType.error
      );
    }
  }
}