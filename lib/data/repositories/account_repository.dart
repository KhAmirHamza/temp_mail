import 'package:dio/dio.dart';
import 'package:temp_mail/data/models/create_account_model.dart';
import 'package:temp_mail/data/repositories/api_client/api_client.dart';

class AccountRepository{

  ApiClient apiClient = ApiClient();


  Future<Response> createAccount(CreateAccountModel createAccountModel) async {
    try {
      Response response = await  apiClient.sendRequest.post('/accounts', data: createAccountModel.toJson());
    return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loginAccount(CreateAccountModel createAccountModel) async {
    try {
      return apiClient.sendRequest.post('/token', data: createAccountModel.toJson());
    } catch (e) {
      rethrow;
    }
  }
}

