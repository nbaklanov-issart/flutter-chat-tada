import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tada_chat/model/enum/chat_status.dart';
import 'package:tada_chat/model/server_data/chat_message.dart';
import 'package:tada_chat/model/states/chat_room_state.dart';
import 'package:tada_chat/model/system/screen_dimensions.dart';
import 'package:tada_chat/screens/full_loading_screen.dart';

class ChatRoomScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ChatRoomState state = Provider.of<ChatRoomState>(context);
    ScreenDimensions dimensions = ScreenDimensions(context);
    return Scaffold(
      appBar: AppBar(title: Text(state.roomName)),
      body: SafeArea(
        child: state.status == ChatStatus.loadingHistory
          ? FullLoadingScreen()
          : _buildMainScreen(state, dimensions)
      )
    );
  }

  Widget _buildMainScreen(ChatRoomState state, ScreenDimensions dimensions) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.messages.length,
            reverse: true,
            itemBuilder: (context, index) {
              return _buildMessage(state.messages[index], dimensions);
            }
          ),
        ),
        SizedBox(
          width: dimensions.width,
          height: dimensions.withoutSafeAreaHeight * 0.1,
          child: ElevatedButton(
            onPressed: () {}, 
            child: Text("Send Message")
          ),
        )
      ]
    );    
  }

  Widget _buildMessageDialog() {
    return Container();
  }

  Widget _buildMessage(ChatMessage message, ScreenDimensions dimensions) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: dimensions.width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 4.0
              ),
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: Text(message.text)
          ),
        )
      ]
    );
  }
}