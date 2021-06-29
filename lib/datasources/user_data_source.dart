import 'package:tada_chat/model/server_data/server_settings.dart';

abstract class UserDataSource {
  void saveServerSettings(ServerSettings settings, { bool overwriteExisting = false });
}