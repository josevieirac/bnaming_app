import 'dart:convert';
import 'dart:io';
import 'package:bnaming_app/views/homePage/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  late Map _visible;

  @override
  Widget build(BuildContext context) {

    final Map _visible = ModalRoute.of(context)!.settings.arguments as Map;

    // Quando a tela Onboard está ativa
    if(_visible["visible"]){
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  children: [

                    const SizedBox(height: 80,),

                    const Text(
                      "Olá,\nseja bem vindo!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(240, 125, 54, 1.0),
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.fromLTRB(40, 20, 45, 20),
                      child:
                      Text(
                        "O bNaming é o app ideal para você que está no processo de criação do nome de sua marca!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(128, 128, 128, 1),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    Image.asset("assets/images/logo_appBar.png"),


                  ],
                ),
              )
            ),
          ],
        ),

      );
    }
    // Quando a tela Onboard não está ativa vai direto para a home
    return const HomePage();
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {                                              // Cahamr quando o cara marcar para não ver mais essa tela
    String data = json.encode(_visible);
    final file = await _getFile();
    return file.writeAsString(data);
  }

}

/*
Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(
                children: const [
                  SizedBox(height: 40,),
                  Text(
                    "Olá,\n seja bem vindo!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromRGBO(240, 125, 54, 1.0),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      );
 */
