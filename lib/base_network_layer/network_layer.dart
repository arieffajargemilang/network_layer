import 'package:dio/dio.dart';
import 'api_options.dart';
import 'base_request_exceptions.dart';
import 'network_response.dart';
import 'network_connection.dart';

enum _methodRequest{
  get,
  post
}

class NetworkLayer{
  final Dio _dio = Dio();

  NetworkLayer(ApiOptions options){
    _dio.options = BaseOptions(
        baseUrl: options.baseUrl,
        headers: options.headers,
        sendTimeout: options.sendTimeout,
        receiveTimeout: options.receiveTimeout,
        connectTimeout: options.connectTimeout
    );
  }

  Future<NetworkResponse> getData(String path)async{
    return _request(_methodRequest.get, path);
  }

  Future<NetworkResponse> postData(String path, Map<String, dynamic> data)async{
    return _request(_methodRequest.post, path, data: data);
  }

  Future<NetworkResponse> _request(_methodRequest method, String path, {Map<String, dynamic>? data})async{
    NetworkResponse networkResponse;
    if(await NetworkConnection.isConnect){
      try{
        if(method == _methodRequest.get){
          Response response = await _dio.get(path);
          networkResponse = NetworkResponse(
              statusCode: response.statusCode,
              statusMessage: response.statusMessage,
              data: response.data
          );
        }else if(method == _methodRequest.post){
          Response response = await _dio.post(path, data: data);
          networkResponse = NetworkResponse(
              statusCode: response.statusCode,
              statusMessage: response.statusMessage,
              data: response.data
          );
        }else{
          networkResponse = NetworkResponse(
              statusCode: null,
              statusMessage: 'method undefined',
              data: null
          );
        }
      }on DioError catch(e){
        networkResponse = NetworkResponse(
            statusCode: e.response?.statusCode,
            statusMessage: BasrRequestExceptions.fromDioError(e).toString(),
            data: e.response!.data
        );
      }
    }else{
      networkResponse = NetworkResponse(
          statusCode: null,
          statusMessage: 'No internet connection',
          data: null
      );
    }
    return networkResponse;
  }
}