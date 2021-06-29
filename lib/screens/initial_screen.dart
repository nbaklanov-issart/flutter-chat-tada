import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tada_chat/model/enum/response_type.dart';
import 'package:tada_chat/model/server_data/server_settings.dart';
import 'package:tada_chat/model/server_info_response.dart';
import 'package:tada_chat/repositories/server_info_repository.dart';
import 'package:tada_chat/repositories/user_data_repository.dart';
import 'package:tada_chat/screens/full_loading_screen.dart';
import 'package:tada_chat/screens/main_screen.dart';

class InitialScreen extends StatelessWidget {
  final ServerInfoRepository _settingsRepository 
                      = GetIt.instance.get<ServerInfoRepository>();
  final UserDataRepository _userRepository 
                      = GetIt.instance.get<UserDataRepository>();
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _settingsRepository.getServerSettings(),
      builder: (buildContext, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          ServerInfoReponse<ServerSettings> data = snapshot.data as ServerInfoReponse<ServerSettings>;
          _userRepository.saveServerSettings(
            data.message,
            overwriteExisting: data.type == ResponseType.success
          );
          return MainScreenWidget();
        } else {
          return FullLoadingScreen();
        }
      }
    );
  }
}