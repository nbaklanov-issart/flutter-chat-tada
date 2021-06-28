import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tada_chat/datasources/server_info_data_source.dart';
import 'package:tada_chat/model/consts/default_server_settings.dart';
import 'package:tada_chat/model/enum/response_type.dart';
import 'package:tada_chat/model/server_data/server_settings.dart';
import 'package:tada_chat/model/server_info_response.dart';
import 'package:tada_chat/repositories/server_info_repository.dart';

import 'server_info_repository_settings_test.mocks.dart';

@GenerateMocks([ServerInfoDataSource])
void main() {
  
  group('Wrong case tests', () {
    test('Server settings top level wrong format test', () async {
      final file = new File('mock_data/wrong_server_settings_format.json');
      final mockData = await file.readAsString();

      MockServerInfoDataSource _dataSource = MockServerInfoDataSource();
      ServerInfoRepository _repository = ServerInfoRepository(_dataSource);  

      when(_dataSource.getServerSettings())
        .thenAnswer((_) async => ServerInfoReponse<String>(mockData, ResponseType.success));

      ServerInfoReponse response = await _repository.getServerSettings();
      expect(response.message, defaultSettings);
      expect(response.type, ResponseType.error);
    });

    test('Server settings inside wrong format test', () async {
      final file = new File('mock_data/wrong_server_settings_format_2.json');
      final mockData = await file.readAsString();

      MockServerInfoDataSource _dataSource = MockServerInfoDataSource();
      ServerInfoRepository _repository = ServerInfoRepository(_dataSource);  

      when(_dataSource.getServerSettings())
        .thenAnswer((_) async => ServerInfoReponse<String>(mockData, ResponseType.success));

      ServerInfoReponse response = await _repository.getServerSettings();
      expect(response.message, defaultSettings);
      expect(response.type, ResponseType.error);
    });

    test('Failed request result test', () async {
      final file = new File('mock_data/server_settings_data.json');
      final mockData = await file.readAsString();

      MockServerInfoDataSource _dataSource = MockServerInfoDataSource();
      ServerInfoRepository _repository = ServerInfoRepository(_dataSource);  

      when(_dataSource.getServerSettings())
        .thenAnswer((_) async => ServerInfoReponse<String>(mockData, ResponseType.error));

      ServerInfoReponse<ServerSettings> response = await _repository.getServerSettings();
      expect(response.message, defaultSettings);
      expect(response.type, ResponseType.error);
    });
  });

  group('Success case tests', () {
    test('Parsed values test', () async {
      final file = new File('mock_data/server_settings_data.json');
      final mockData = await file.readAsString();

      MockServerInfoDataSource _dataSource = MockServerInfoDataSource();
      ServerInfoRepository _repository = ServerInfoRepository(_dataSource);  

      when(_dataSource.getServerSettings())
        .thenAnswer((_) async => ServerInfoReponse<String>(mockData, ResponseType.error));

      ServerInfoReponse<ServerSettings> response = await _repository.getServerSettings();
      expect(response.message.uptime, defaultUpTime);
      expect(response.message.maxMessageLength, maxMessageLength);
      expect(response.message.maxUsernameLength, maxUsernameLength);
      expect(response.message.maxRoomTitleLength, maxRoomNameLength);
    });
  });
}