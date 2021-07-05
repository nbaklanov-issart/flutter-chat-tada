import 'package:flutter/material.dart';
import 'package:tada_chat/helper/date_helper.dart';
import 'package:tada_chat/model/consts/colors.dart';
import 'package:tada_chat/model/server_data/chat_message.dart';
import 'package:tada_chat/screens/chat/widgets/message_item.dart';

class MessagesList extends StatelessWidget {
  final String _username;
  final List<ChatMessage> _messages;

  MessagesList(
    this._username,
    this._messages
  );

  @override
  Widget build(BuildContext context) {    
    return Expanded(      
      child: Container(
        color: chatListBackColor,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView.builder(                    
            itemCount: _messages.length,
            reverse: true,
            itemBuilder: (context, index) {
              return _buildMessage(_messages[index]);
            }
          )
        ),
      ) 
    );
  }

  Widget _buildMessage(ChatMessage message) {
    return message.sender.username == _username
      ? MessageItem(
          message.text, 
          message.sender.username,
          DateHelper.convertToString(message.created),
          MainAxisAlignment.end, 
          Colors.green
        )
      : MessageItem(
          message.text, 
          message.sender.username,
          DateHelper.convertToString(message.created),
          MainAxisAlignment.start, 
          Colors.grey
        );
  }
}