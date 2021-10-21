import 'package:flutter/material.dart';
import 'package:network_layer/network_layer.dart';
import 'service/berita_service.dart';

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
              return Center(
                child: Text('Data ada.'),
              );
            }else{
              return Center(
                child: Text('${snapshot.data?.statusMessage}'),
              );
            }
          }
          return Center(
            child: Text('Loading...'),
          );
        }
      ),
    );
  }
}
