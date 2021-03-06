import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tada_chat/helper/date_helper.dart';
import 'package:tada_chat/model/consts/style.dart';
import 'package:tada_chat/model/server_data/chat_room.dart';
import 'package:tada_chat/model/server_data/chat_rooms_list.dart';
import 'package:tada_chat/model/server_info_response.dart';
import 'package:tada_chat/repositories/server_info_repository.dart';
import 'package:tada_chat/screens/chat/chat_room_builder.dart';
import 'package:tada_chat/screens/full_loading_screen.dart';

class ServerRoomsScreen extends StatelessWidget {
  final ServerInfoRepository _repository = GetIt.instance.get<ServerInfoRepository>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _repository.getRoomsList(),
      builder: (buildContext, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {          
          ServerInfoReponse<ChatRoomsList> data = snapshot.data as ServerInfoReponse<ChatRoomsList>;          
          print(data.type);
          return _buildRoomsList(data.message.result, context);
        } else {
          return FullLoadingScreen();
        }
      }
    );
  }

  Widget _buildRoomsList(List<ChatRoom> rooms, BuildContext context) {
    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (listContext, index) {
        return _buildRoomRow(rooms[index], context);
      }
    );
  }

  Widget _buildRoomRow(ChatRoom room, BuildContext context) {
    String lastMessage = DateHelper.convertToString(room.lastMessage.created);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _openRoom(room, context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(room.name, style: messageSenderStyle),
            Text(
              "Last message : $lastMessage", 
              style: dateTextStyle
            )
          ]
        )
      )
    );
  }

  void _openRoom(ChatRoom room, BuildContext context) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ChatRoomBuilder(room.name)
      )
    );
  }
}