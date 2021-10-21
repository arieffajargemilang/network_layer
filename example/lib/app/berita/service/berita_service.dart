import 'package:example/config/server/setup_server_satu.dart';
import 'package:network_layer/network_layer.dart';

class BeritaService{

  static final SetupServerSatu _setup = SetupServerSatu();
  static const String _post = 'post';

  static Future<NetworkResponse> getPostingan()async{
    NetworkResponse response = await NetworkLayer(_setup).getData(_post);
    return response;
  }
}