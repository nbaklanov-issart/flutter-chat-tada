import 'package:tada_chat/model/enum/response_type.dart';

class ServerInfoReponse<T> {
  final T message;
  final ResponseType type;

  ServerInfoReponse(
    this.message,
    this.type
  );
}