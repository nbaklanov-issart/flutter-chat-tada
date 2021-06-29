import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tada_chat/datasources/user_data_source.dart';
import 'package:tada_chat/model/server_data/server_settings.dart';

class PreferencesDataSource extends UserDataSource {
  static const settingsPrefsField = "server_settings";

  final SharedPreferences _prefs;

  PreferencesDataSource(this._prefs);

  @override
  void saveServerSettings(ServerSettings settings, {bool overwriteExisting = false}) {
    if (overwriteExisting || !_prefs.containsKey(settingsPrefsField)) {
      _writeNewSettingsValue(settings);
    }      
  }

  void _writeNewSettingsValue(ServerSettings settings) {
    Map<String, dynamic> settingsMap = settings.toJson();
    String settingsString = json.encode(settingsMap);

    _prefs.setString(settingsPrefsField, settingsString);
  }
}