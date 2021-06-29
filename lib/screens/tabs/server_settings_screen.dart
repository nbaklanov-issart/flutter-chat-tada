import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tada_chat/model/server_data/server_settings.dart';
import 'package:tada_chat/repositories/user_data_repository.dart';

class ServerSettingsScreen extends StatelessWidget {
  final UserDataRepository _dataRepository = GetIt.instance.get<UserDataRepository>();

  @override
  Widget build(BuildContext context) {
    ServerSettings settings = _dataRepository.getServerSettings();
    return Center(
      child: Column(
        children: [
          Text("Max message length : ${settings.maxMessageLength}"),
          Text("Max room title length : ${settings.maxRoomTitleLength}"),
          Text("Max username length : ${settings.maxUsernameLength}")
        ]
      )
    );
  }
}