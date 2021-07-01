import 'dart:convert';

import 'package:tada_chat/model/consts/default_user_settings.dart';
import 'package:tada_chat/model/web_socket_data/chat_outgoing_message.dart';
import 'package:web_socket_channel/io.dart';

class WebService {
  static const String _baseAddress = "wss://nane.tada.team/ws";

  final String _userName = defaultUsername;
  IOWebSocketChannel? _channel;
  

  void connect() {
    _channel = IOWebSocketChannel.connect(
      Uri.parse("$_baseAddress?username=$_userName"),
      pingInterval: const Duration(seconds: 1)
    );

    _channel?.stream.listen((event) {
      print("Data from stream : $event");
    });
  }

  void send(String text) {
    Map<String, dynamic> map = ChatOutgoingMessage("fff", text, defaultId).toJson();
    String parsed = json.encode(map);

    _channel?.sink.add(parsed);
  }

  void close() {
    _channel?.sink.close();
  }
}