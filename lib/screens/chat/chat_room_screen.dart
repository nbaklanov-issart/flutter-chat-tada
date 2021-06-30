import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tada_chat/model/states/chat_room_state.dart';

class ChatRoomScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ChatRoomState state = Provider.of<ChatRoomState>(context);    
    return Scaffold(
      body: Container(
          
      ),
    );
  }
}