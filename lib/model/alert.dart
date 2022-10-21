import 'package:flutter/material.dart';

class Alert{
   late String mensagem;
   late bool continuar=false;

    Alert({
      
      required this.mensagem
    
  });

  Alert alerta1(){
    Alert alerta1 = Alert(mensagem: "Nome já registrado");
    return alerta1;
  }

  snackBar1(BuildContext context){

  final snackBar =
  SnackBar(
        backgroundColor: const Color.fromRGBO(128, 128, 128, 1),
        content: const Text(
          'Nome já registrado',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }

 snackBar2(BuildContext context){
      final snackBar = SnackBar(
      backgroundColor: const Color.fromRGBO(128, 128, 128, 1),
      content: const Text(
      'Insira os dados antes de prosseguir',
      style: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      ),
      ),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
      label: 'OK',
      textColor: Colors.white,
      onPressed: () {
      // Some code to undo the change.
      },
      ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
}



