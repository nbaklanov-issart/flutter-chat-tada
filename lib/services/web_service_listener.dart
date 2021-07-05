import 'package:tada_chat/model/web_socket_data/chat_incoming_message.dart';

abstract class WebServiceListener {
  void onData(ChatIncomingMessage message);
}