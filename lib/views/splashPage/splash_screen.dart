import 'dart:convert';
import 'dart:io';

import 'package:bnaming_app/views/onboardingPage/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Map _visible = {};

  @override
  void initState() {
    super.initState();
    //Carregando dados
    _readData().then((value) {
      setState(() {
        _visible = json.decode(value!);
      });
    });
    // Chamada da função para navegar para a home
    _navegateToHome();
  }

  // Função para navegar para a home apos um período de tempo
  _navegateToHome() async{
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const OnboardingPage(),
        settings: RouteSettings(
          arguments: _visible,
        )
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Cor de background
      color: const Color.fromRGBO(240, 125, 54, 1.0),

      //Coluna do da tela Splash
      child: Column(
        children: [
          //Configurando imagem do logo
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(135, 50, 135, 0),
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
          ),
          //Configurando Imagem de desenvolvedores
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
            child: Image.asset("assets/images/proprietarios.png"),
          ),
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<String?> _readData() async{
    try{
      final file = await _getFile();
      return file.readAsString();
    }catch(e){
      return null;
    }
  }

}