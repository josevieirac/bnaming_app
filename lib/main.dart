

import 'package:bnaming_app/views/splashPage/splash_screen.dart';
import 'package:flutter/material.dart';

//Função Inicial do APP
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bNaming',
      home: SplashScreen(),
    );
  }
}

