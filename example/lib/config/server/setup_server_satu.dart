import 'package:network_layer/network_layer.dart';

class SetupServerSatu extends ApiOptions{

  @override
  String get baseUrl => 'https://jsonplaceholder.typicode.com/';

  @override
  Map<String, dynamic> get headers => {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}