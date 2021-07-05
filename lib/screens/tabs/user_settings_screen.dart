import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tada_chat/repositories/user_data_repository.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({ Key? key }) : super(key: key);

  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  final UserDataRepository _dataRepository = GetIt.instance.get<UserDataRepository>();
  String _enteredUsername = "";

  @override
  void initState() {
    super.initState();
    _enteredUsername = _dataRepository.getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          _buildTextField(),
          ElevatedButton(
            onPressed: () {
              _dataRepository.saveUsername(_enteredUsername);
            }, 
            child: Text("Save username")
          ),
          Spacer()
        ]
      )
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: TextEditingController(text: _enteredUsername),
      maxLength: _dataRepository.getServerSettings().maxUsernameLength,      
      onChanged: (text) {
        _enteredUsername = text;
      }
    );
  }
}