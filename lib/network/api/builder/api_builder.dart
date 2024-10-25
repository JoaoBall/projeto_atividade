import 'package:dio/dio.dart';
import 'package:projeto_atividade/util/constants.dart';


class ApiBuilder {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constants.getApiUrl(),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 180),
    ),
  );

  static Dio createService() {
    return _dio;
  }
}
