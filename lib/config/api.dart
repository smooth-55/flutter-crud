import 'package:dio/dio.dart';

late final dio = Dio(); // With default `Options`.
const BaseUrl  = 'http://localhost:8000';
void configureDio() {
  print("initializing dio");
  // Set default configs
  dio.options.baseUrl = BaseUrl;
  dio.options.connectTimeout = Duration(seconds: 5);
  dio.options.receiveTimeout = Duration(seconds: 3);
}

