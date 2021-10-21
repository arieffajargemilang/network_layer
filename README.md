# Network layer

### Package
- [dio](https://pub.dev/packages/dio)
- [connectivity](https://pub.dev/packages/connectivity)

### Setup awal
- tambahkan lib network_layer pada pubspec.yml project.
- buat class setup pada folder lib > config > server.
- beri nama sesuai server/baseurl. contoh: (server_satu.dart).
- extend ApiOptions pada class setup yang sudah dibuat.
```dart
class SetupServerSatu extends ApiOptions{

  @override
  /// tentukan base url
  String get baseUrl => 'https://jsonplaceholder.typicode.com/';

  @override
  /// tentukan header API request
  Map<String, dynamic> get headers => {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

}
```

### Penggunaan pada service
```dart
class BeritaService{

  static final SetupServerSatu _setup = SetupServerSatu();
  static const String _post = 'post';

  /// buat method per path
  static Future<NetworkResponse> getPostingan()async{
    NetworkResponse response = await NetworkLayer(_setup).getData(_post);
    /// kirim hasil response dari server baik yang success atau error
    return response;
  }
  
}
``` 
### Pemanggilan service pada widget
```dart
class BeritaApp extends StatefulWidget {
  const BeritaApp({Key? key}) : super(key: key);

  @override
  _BeritaAppState createState() => _BeritaAppState();
}

class _BeritaAppState extends State<BeritaApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: BeritaService.getPostingan(),
        builder: (BuildContext context, AsyncSnapshot<NetworkResponse> snapshot){
          if(snapshot.hasData){
            if(snapshot.data?.statusCode == 200){
              /// tampilkan data jika ada.
              return Center(
                child: Text('Data ada.'),
              );
            }else{
              /// tampilkan pesan error.
              return Center(
                child: Text('${snapshot.data?.statusMessage}'),
              );
            }
          }
          /// tampilkan loading saat proses sedang berlangsung.
          return Center(
            child: Text('Loading...'),
          );
        }
      ),
    );
  }
}

```