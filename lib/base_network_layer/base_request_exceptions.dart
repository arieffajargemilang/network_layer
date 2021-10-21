import 'package:dio/dio.dart';

class BasrRequestExceptions implements Exception{

  String _message = 'Initial Error';

  BasrRequestExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        _message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        _message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        _message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        _message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        _message = _handleError(dioError.response?.statusCode, dioError.response?.statusMessage);
        break;
      case DioErrorType.sendTimeout:
        _message = "Send timeout in connection with API server";
        break;
      default:
        _message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, String? errorMessage) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return '$errorMessage';
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => _message;
}