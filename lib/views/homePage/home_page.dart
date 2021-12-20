
import 'package:bnaming_app/views/evaluationPage/evaluation_page.dart';
import 'package:bnaming_app/views/helpPage/help_page.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _controllerNaming = TextEditingController();
  MaterialStateProperty<Color> _color = MaterialStateProperty.all<Color>(Color.fromRGBO(128, 128, 128, .7));


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Configurando App Bar
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(110),
          child: Image.asset("assets/images/logo_appBar.png"),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(240, 125, 54, 1.0),
      ),

      //Configurando Botão flutuante
      floatingActionButton: FloatingActionButton(
        child: Icon(Mdi.help,size: 30,),
        backgroundColor: Color.fromRGBO(240, 125, 54, 1.0),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage()));
        },
      ),

      //Configurando corpo da página
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerNaming,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,

              decoration: InputDecoration(
                labelText: "Insira o nome a ser avaliado",
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(128, 128, 128, .7),
                ),
                alignLabelWithHint: true,
              ),

              style: TextStyle(
                color: Color.fromRGBO(240, 125, 54, 1.0),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),

              onChanged: (value){
                setState(() {
                  if(_controllerNaming.text.isEmpty){
                    _color = MaterialStateProperty.all<Color>(Color.fromRGBO(128, 128, 128, .7));
                  }else{
                    _color = MaterialStateProperty.all<Color>(Color.fromRGBO(240, 125, 54, 1.0));
                  }
                });
              },
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text(
                      "AVALIAR",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: _color,
                    ),
                    onPressed: (){
                      if(_controllerNaming.text.isNotEmpty){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EvaluationPage()));
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}
