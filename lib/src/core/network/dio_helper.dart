import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptors/api_interceptor.dart';

class Configs {
  static const baseUrl = 'https://sportportal.com.tm/api';
}

class DioHelper {
  static final _instance = Dio(_baseOptions)
    ..interceptors.addAll([
      // PrettyDioLogger(
      //     requestHeader: true,
      //     requestBody: true,
      //     responseBody: true,
      //     responseHeader: false,
      //     error: true,
      //     compact: true,
      //     maxWidth: 70),
      ApiInterceptor(),
    ]);

  static final _baseOptions = BaseOptions(
    baseUrl: Configs.baseUrl,
    contentType: 'application/json',
  );

  static Dio get instance {
    return _instance;
  }
}
