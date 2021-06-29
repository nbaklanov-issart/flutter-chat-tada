import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tada_chat/datasources/server_info_data_source.dart';
import 'package:tada_chat/model/enum/response_type.dart';
import 'package:tada_chat/model/server_data/message_history.dart';
import 'package:tada_chat/model/server_info_response.dart';
import 'package:tada_chat/repositories/server_info_repository.dart';

import 'server_info_repository_history_test.mocks.dart';

@GenerateMocks([ServerInfoDataSource])
void main() {
  
  const String testRoomName = "kozma";

  group('Wrong case tests', () {
    test('History top level wrong format test', () async {
      final file = new File('mock_data/wrong_kozma_history_format.json');
      final mockData = await file.readAsString();

      MockServerInfoDataSource _dataSource = MockServerInfoDataSource();
      ServerInfoRepository _repository = ServerInfoRepository(_dataSource);  

      when(_dataSource.getMessagesHistory(testRoomName))
        .thenAnswer((_) async => ServerInfoReponse<String>(mockData, ResponseType.success));

      ServerInfoReponse<MessageHistory> response = await _repository.getRoomHistory(testRoomName);
      expect(response.message.result.isEmpty, true);
      expect(response.type, ResponseType.error);
    });

    test('Failed request result test', () async {
      final file = new File('mock_data/kozma_history_data.json');
      final mockData = await file.readAsString();

      MockServerInfoDataSource _dataSource = MockServerInfoDataSource();
      ServerInfoRepository _repository = ServerInfoRepository(_dataSource);  

      when(_dataSource.getMessagesHistory(testRoomName))
        .thenAnswer((_) async => ServerInfoReponse<String>(mockData, ResponseType.error));

      ServerInfoReponse<MessageHistory> response = await _repository.getRoomHistory(testRoomName);
      expect(response.message.result.isEmpty, true);
      expect(response.type, ResponseType.error);
    });
  });

  group('Success case tests', () {
    test('Parsed values test', () async {
      final file = new File('mock_data/kozma_history_data.json');
      final mockData = await file.readAsString();

      MockServerInfoDataSource _dataSource = MockServerInfoDataSource();
      ServerInfoRepository _repository = ServerInfoRepository(_dataSource);  

      when(_dataSource.getMessagesHistory(testRoomName))
        .thenAnswer((_) async => ServerInfoReponse<String>(mockData, ResponseType.success));

      ServerInfoReponse<MessageHistory> response = await _repository.getRoomHistory(testRoomName);
      expect(response.message.result.length, 2);
      expect(response.message.result.isNotEmpty, true);      
    });
  });
}