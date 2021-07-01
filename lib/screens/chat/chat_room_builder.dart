import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:tada_chat/model/states/chat_room_state.dart';
import 'package:tada_chat/repositories/server_info_repository.dart';
import 'package:tada_chat/screens/chat/chat_room_screen.dart';

class ChatRoomBuilder extends StatelessWidget {
  final ServerInfoRepository _repository = GetIt.instance.get<ServerInfoRepository>();
  final String _roomName;

  ChatRoomBuilder(
    this._roomName,
    { Key? key }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatRoomState>(
      create: (context) {
        final state = ChatRoomState(_roomName, _repository);
        state.refreshMessages();
        return state;
      },
      child: Consumer<ChatRoomState>(
        builder: (context, value, child) => ChatRoomScreen()
      )
    );
  }
}