import 'dart:convert';

import 'package:tada_chat/model/consts/default_user_settings.dart';
import 'package:tada_chat/model/web_socket_data/chat_incoming_message.dart';
import 'package:tada_chat/model/web_socket_data/chat_outgoing_message.dart';
import 'package:tada_chat/services/web_service_listener.dart';
import 'package:web_socket_channel/io.dart';

class WebService {
  static const String _baseAddress = "wss://nane.tada.team/ws";

  String _userName = defaultUsername;

  IOWebSocketChannel? _channel;
  WebServiceListener? _listener;

  void setUsername(String newUsername) {
    _userName = newUsername;
  }

  void setListener(WebServiceListener chatListener) {
    _listener = chatListener;
  }

  void connect() {
    _channel = IOWebSocketChannel.connect(
      Uri.parse("$_baseAddress?username=$_userName"),
      pingInterval: const Duration(seconds: 1)
    );

    _channel?.stream.listen((event) {
      Map<String, dynamic> map = json.decode(event);
      ChatIncomingMessage message = ChatIncomingMessage.fromJson(map);

      _listener?.onData(message);
    });
  }

  void send(String text, String roomName) {
    Map<String, dynamic> map = ChatOutgoingMessage(roomName, text, defaultId).toJson();
    String parsed = json.encode(map);

    _channel?.sink.add(parsed);
  }

  void close() {
    _channel?.sink.close();
  }
}