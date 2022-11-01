import 'package:dio/dio.dart';

import '../../../../key.dart';
import '../../../constants/app_url.dart';
import 'logging_interceptor.dart';

class ApiService {
  static String token = '';

  static final _options = BaseOptions(
    baseUrl: AppUrl.baseUrl,
    headers: {
      Headers.acceptHeader: 'application/json',
      'X-CoinAPI-Key': apiKey,
    },
  );

  final Dio _dio = Dio(_options)..interceptors.add(LoggingInterceptor());

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
