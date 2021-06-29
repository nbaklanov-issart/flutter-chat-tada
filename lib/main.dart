import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tada_chat/datasources/http_api_data_source.dart';
import 'package:tada_chat/datasources/preferences_data_source.dart';
import 'package:tada_chat/datasources/server_info_data_source.dart';
import 'package:tada_chat/datasources/user_data_source.dart';
import 'package:tada_chat/repositories/server_info_repository.dart';
import 'package:tada_chat/repositories/user_data_repository.dart';
import 'package:tada_chat/screens/initial_screen.dart';

void main() async {  
  WidgetsFlutterBinding.ensureInitialized();

  GetIt _instance = GetIt.instance;

  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _instance.registerSingleton<UserDataSource>(PreferencesDataSource(_prefs));
  _instance.registerSingleton<UserDataRepository>(
    UserDataRepository(_instance.get<UserDataSource>())
  );



  _instance.registerSingleton<ServerInfoDataSource>(HttpApiDataSource());
  _instance.registerSingleton<ServerInfoRepository>(
    ServerInfoRepository(_instance.get<ServerInfoDataSource>())
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaDa Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitialScreen()
    );
  }
}
