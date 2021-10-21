abstract class ApiOptions{
  late String baseUrl;
  late Map<String, dynamic> headers;
  int sendTimeout = 3000;
  int receiveTimeout = 3000;
  int connectTimeout = 3000;
}