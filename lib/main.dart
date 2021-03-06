import 'package:bnaming_app/views/splashPage/splash_screen.dart';
import 'package:flutter/material.dart';
import 'http/client.dart';

//Função Inicial do APP
void main() {

  //Requisitando inicialmente a API para
  ClientHttp classe = ClientHttp();
  classe.getAPI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'bNaming',
      home: SplashScreen(),
    );
  }
}

