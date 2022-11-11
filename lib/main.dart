
import 'package:bnaming_app/http/RegistroBR.dart';
import 'package:bnaming_app/views/splashPage/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Repository/HistoryRepository.dart';
import 'http/client.dart';

//Função Inicial do APP
Future<void> main() async {

  //Requisitando inicialmente a API para
  ClientHttp classe = ClientHttp();
  classe.getAPI();
  final RBR _api = RBR();
  _api.getAPI('');

  runApp(
    
  ChangeNotifierProvider(
    create:(context)=> HistoryRepository(),
    child: MyApp()
  ),
  );
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

