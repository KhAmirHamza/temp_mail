import 'package:dio/dio.dart';
import 'package:temp_mail/data/repositories/api_client/api_client.dart';

class InboxRepository{

  ApiClient apiClient = ApiClient();

  Future<Response> fetchInboxs(String token) async {
    try {
      return await apiClient.sendRequest.get(
        '/messages',
         options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer $token",
          }));
    } catch (e) {
      rethrow;
    }
  }
}