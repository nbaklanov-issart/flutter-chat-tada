import 'package:flutter/material.dart';
import 'package:tada_chat/datasources/server_info_data_source.dart';
import 'package:tada_chat/model/consts/default_user_settings.dart';
import 'package:tada_chat/model/enum/chat_status.dart';
import 'package:tada_chat/model/server_data/chat_message.dart';
import 'package:tada_chat/model/server_data/message_history.dart';
import 'package:tada_chat/repositories/server_info_repository.dart';
import 'package:tada_chat/services/web_service.dart';

class ChatRoomState with ChangeNotifier {
  final WebService _webService = WebService();
  final ServerInfoRepository _serverDataRepository;
  final String _chatRoomName;

  String get userName => defaultUsername;
  String get roomName => _chatRoomName;
  ChatStatus get status => _status;
  List<ChatMessage> get messages => _history.result;

  MessageHistory _history = MessageHistory(List.empty());
  ChatStatus _status = ChatStatus.ready;

  ChatRoomState(
    this._chatRoomName,
    this._serverDataRepository
  ) {
    _webService.connect();
    _webService.send("my message");
  }

  void refreshMessages() {
    _status = ChatStatus.loadingHistory;
    _serverDataRepository.getRoomHistory(roomName)
      .then((value) {
        _status = ChatStatus.ready;
        _history = value.message;
        notifyListeners();
      });
    notifyListeners();    
  }

  @override
  void dispose() {
    _webService.close();
    super.dispose();
  }
}