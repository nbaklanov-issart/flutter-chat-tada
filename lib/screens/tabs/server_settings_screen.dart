import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tada_chat/datasources/user_data_source.dart';
import 'package:tada_chat/repositories/user_data_repository.dart';

class ServerSettingsScreen extends StatelessWidget {
  final UserDataRepository _dataRepository = GetIt.instance.get<UserDataRepository>();

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}