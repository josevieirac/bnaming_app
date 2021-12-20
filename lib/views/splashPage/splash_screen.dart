
import 'package:bnaming_app/views/homePage/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Chamada da função para navegar para a home
    _navegateToHome();
  }

  // Função para navegar para a home apos um período de tempo
  _navegateToHome() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Cor de background
      color: Color.fromRGBO(240, 125, 54, 1.0),

      //Coluna do da tela Splash
      child: Column(
        children: [
          //Configurando imagem do logo
          Expanded(
            child: Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(135, 50, 135, 0),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
            ),
          ),
          //Configurando Imagem de desenvolvedores
          Padding(
            padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
            child: Image.asset("assets/images/proprietarios.png"),
          ),
        ],
      ),
    );
  }
}
