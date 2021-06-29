import 'package:tada_chat/datasources/user_data_source.dart';
import 'package:tada_chat/model/server_data/server_settings.dart';

class UserDataRepository {
  final UserDataSource _dataSource;

  UserDataRepository(this._dataSource);

  void saveServerSettings(ServerSettings settings, { bool overwriteExisting = false }) {
    _dataSource.saveServerSettings(settings, overwriteExisting: overwriteExisting);
  }

  ServerSettings getServerSettings() {
    return _dataSource.getServerSettings();
  }
}