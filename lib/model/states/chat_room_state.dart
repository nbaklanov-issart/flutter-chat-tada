import 'package:flutter/material.dart';
import 'package:tada_chat/model/consts/default_user_settings.dart';
import 'package:tada_chat/model/enum/chat_status.dart';
import 'package:tada_chat/model/server_data/chat_message.dart';
import 'package:tada_chat/model/web_socket_data/chat_incoming_message.dart';
import 'package:tada_chat/repositories/server_info_repository.dart';
import 'package:tada_chat/repositories/user_data_repository.dart';
import 'package:tada_chat/services/web_service.dart';
import 'package:tada_chat/services/web_service_listener.dart';

class ChatRoomState with ChangeNotifier, WebServiceListener {
  final WebService _webService = WebService();
  final ServerInfoRepository _serverDataRepository;
  final UserDataRepository _userDataRepository;
  final String _chatRoomName;

  String get message => _chatMessageText;
  String get userName => defaultUsername;
  String get roomName => _chatRoomName;
  ChatStatus get status => _status;
  List<ChatMessage> get messages => _history;

  List<ChatMessage> _history = List.empty();
  ChatStatus _status = ChatStatus.ready;
  String _chatMessageText = "";

  ChatRoomState(
    this._chatRoomName,
    this._serverDataRepository,
    this._userDataRepository
  ) {
    _webService.setUsername(_userDataRepository.getUsername());
    _webService.setListener(this);
    _webService.connect();
  }

  void refreshMessages() {
    _status = ChatStatus.loadingHistory;
    _serverDataRepository.getRoomHistory(roomName)
      .then((value) {
        _status = ChatStatus.ready;
        _history = value.message.result.reversed.toList();
        notifyListeners();
      });
    notifyListeners();    
  }

  void setMessageText(String newText) {
    _chatMessageText = newText;
  }

  void sendMessage() {
    if (_chatMessageText.isNotEmpty) {
      _webService.send(_chatMessageText, _chatRoomName);
      _chatMessageText = "";
      notifyListeners();
    }    
  }

  @override
  void onData(ChatIncomingMessage message) {
    if (message.room == _chatRoomName) {
      _history.insert(
        0,
        ChatMessage(
          message.text,
          message.room,
          message.created,
          message.sender
        )
      );   
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _webService.close();
    super.dispose();
  }
}