import 'package:http/http.dart' as http;
import 'package:tada_chat/datasources/server_info_data_source.dart';
import 'package:tada_chat/model/enum/response_type.dart';
import 'package:tada_chat/model/server_info_response.dart';

class HttpApiDataSource extends ServerInfoDataSource {
  static const String baseServerAddress = "https://nane.tada.team/api";
  static const int successStatus = 200;


  @override
  Future<ServerInfoReponse<String>> getServerSettings() async {
    return _performGetRequest(
      "$baseServerAddress/settings", 
      "Exception during settings request"
    );
  }

  @override
  Future<ServerInfoReponse<String>> getMessagesHistory(String roomName) async {
    return _performGetRequest(
      "$baseServerAddress/rooms/$roomName/history", 
      "Exception during room history request"
    );
  }

  @override
  Future<ServerInfoReponse<String>> getChatRooms() {
    return _performGetRequest(
      "$baseServerAddress/rooms", 
      "Exception during room list request"
    );
  }

  Future<ServerInfoReponse<String>> _performGetRequest(
    String url,
    String errorMessage
  ) async {
    try {      
      http.Response response = await http.get(Uri.parse(url));
      return response.statusCode == successStatus
        ? ServerInfoReponse(response.body, ResponseType.success)
        : ServerInfoReponse(
            "Settings respose status : ${response.statusCode}",
            ResponseType.error
          );
    } catch(exception) {
      print(exception);
      return ServerInfoReponse(
        errorMessage,
        ResponseType.error
      );
    }
  }
}