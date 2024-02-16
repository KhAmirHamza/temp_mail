import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class ApiClient{
  Dio dio = Dio();

  ApiClient(){
    dio.options.baseUrl = "https://api.mail.tm";
    dio.interceptors.add(PrettyDioLogger());
  }
  Dio get sendRequest => dio;
}