class NetworkResponse {
  NetworkResponse({
    this.statusCode,
    this.statusMessage,
    this.data,
  });

  int? statusCode;
  String? statusMessage;
  dynamic data;
}