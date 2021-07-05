import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:tada_chat/model/enum/chat_status.dart';
import 'package:tada_chat/model/states/chat_room_state.dart';
import 'package:tada_chat/model/system/screen_dimensions.dart';
import 'package:tada_chat/repositories/user_data_repository.dart';
import 'package:tada_chat/screens/chat/widgets/messages_list.dart';
import 'package:tada_chat/screens/full_loading_screen.dart';

class ChatRoomScreen extends StatelessWidget {
  final UserDataRepository _repository = GetIt.instance.get<UserDataRepository>();

  @override
  Widget build(BuildContext context) {
    ChatRoomState state = Provider.of<ChatRoomState>(context);
    ScreenDimensions dimensions = ScreenDimensions(context);
    return Scaffold(
      appBar: AppBar(title: Text(state.roomName)),
      body: SafeArea(
        child: state.status == ChatStatus.loadingHistory
          ? FullLoadingScreen()
          : _buildMainScreen(state, dimensions, context)
      )
    );
  }

  Widget _buildMainScreen(ChatRoomState state, ScreenDimensions dimensions, BuildContext context) {
    return Column(
      children: [
        MessagesList(_repository.getUsername(), state.messages),
        _buildTextField(state),
        ElevatedButton(
          onPressed: () {
            state.sendMessage();
            FocusScope.of(context).unfocus();
          }, 
          child: Text("Send Message")
        )
      ]
    );    
  }

  Widget _buildTextField(ChatRoomState state) {
    return TextField(
      controller: TextEditingController(text: state.message),
      maxLength: _repository.getServerSettings().maxMessageLength,
      maxLines: null,
      onChanged: (text) {
        state.setMessageText(text);
      }
    );
  }
}