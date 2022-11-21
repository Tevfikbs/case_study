import 'package:dio/dio.dart';

class DioClient {
  Dio dio = Dio(); // with default Options

  DioClient() {
    setupDio();
  }

  setupDio() async {
    dio.options.baseUrl = "http://api.weatherstack.com/current";
    dio.options.connectTimeout = 3000;
    dio.options.receiveTimeout = 3000;
  }
}
