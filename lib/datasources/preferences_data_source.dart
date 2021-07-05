import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tada_chat/datasources/user_data_source.dart';
import 'package:tada_chat/model/consts/default_server_settings.dart';
import 'package:tada_chat/model/consts/default_user_settings.dart';
import 'package:tada_chat/model/server_data/server_settings.dart';

class PreferencesDataSource extends UserDataSource {
  static const _settingsPrefsField = "server_settings";
  static const _usernamePrefsField = "user_name";

  final SharedPreferences _prefs;

  PreferencesDataSource(this._prefs);

  @override
  void saveServerSettings(ServerSettings settings, {bool overwriteExisting = false}) {
    if (overwriteExisting || !_prefs.containsKey(_settingsPrefsField)) {
      _writeNewSettingsValue(settings);
    }      
  }

  void _writeNewSettingsValue(ServerSettings settings) {
    Map<String, dynamic> settingsMap = settings.toJson();
    String settingsString = json.encode(settingsMap);

    _prefs.setString(_settingsPrefsField, settingsString);
  }

  @override
  ServerSettings getServerSettings() {
    ServerSettings settings = defaultSettings;
    try {
      if (_prefs.containsKey(_settingsPrefsField)) {
        String stringSettings = _prefs.getString(_settingsPrefsField) ?? "";
        Map<String, dynamic> map = json.decode(stringSettings);
        return ServerSettings.fromJson(map);
      } 
    } finally {
      return settings;
    }    
  }

  @override
  String getUserName() {
    return _prefs.getString(_usernamePrefsField) ?? defaultUsername;
  }

  @override
  void saveUserName(String newUsername) {
    _prefs.setString(_usernamePrefsField, newUsername);
  }
}