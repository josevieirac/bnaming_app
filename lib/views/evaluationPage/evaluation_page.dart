import 'package:flutter/material.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({Key? key}) : super(key: key);

  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Configurando App Bar
      appBar: AppBar(
        title: Text(
          "Avaliação",
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
            "Avaliação aqui...",
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
