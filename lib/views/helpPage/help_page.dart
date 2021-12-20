import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Configurando App Bar
      appBar: AppBar(
        title: Text(
          "Informações",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(240, 125, 54, 1.0),
      ),

      //Configurando corpo da página
      body: Container(
        child: Center(
          child: Text(
            "Informações aqui...",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(240, 125, 54, 1.0),
            ),
          ),
        ),
      ),

    );
  }
}
