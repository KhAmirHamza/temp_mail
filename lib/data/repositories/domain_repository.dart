import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:temp_mail/data/models/domain_model.dart';
import 'package:temp_mail/data/repositories/api_client/api_client.dart';

class DomainRepository{

  ApiClient apiClient = ApiClient();

  Future<List<DomainModel>> fetchDoamins() async{
    try {
      Response response = await apiClient.sendRequest.get('/domains');
      List<dynamic> domainData =  response.data['hydra:member'];
        return domainData.map((item)=>DomainModel.fromJson(item)).toList();
    } on DioException catch(e) {
      rethrow;
     // onError(e);
      //return [];
    }
  }
}