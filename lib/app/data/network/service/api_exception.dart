import 'package:dio/dio.dart';

class ApiException implements Exception {
  ApiException.fromDioError(DioError dioError, {bool isLogin = false}) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
          isLogin: isLogin,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  late String message;

  @override
  String toString() => message;

  String _handleError(int? statusCode, dynamic error, {bool isLogin = false}) {
    switch (statusCode) {
      case 400:
        return error['error'];
      //return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return error['error'];
      // return 'Forbidden';
      case 404:
        return error['error'] ?? 'Not found';
      case 409:
        return error['error'] ?? error['message'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }
}
