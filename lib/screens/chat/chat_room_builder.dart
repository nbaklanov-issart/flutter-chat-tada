import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tada_chat/model/states/chat_room_state.dart';
import 'package:tada_chat/screens/chat/chat_room_screen.dart';

class ChatRoomBuilder extends StatelessWidget {
  const ChatRoomBuilder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatRoomState>(
      create: (context) => ChatRoomState(),
      child: Consumer<ChatRoomState>(
        builder: (context, value, child) => ChatRoomScreen()
      )
    );
  }
}