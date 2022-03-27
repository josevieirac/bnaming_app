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

  String _dropdownValue = "alimentos/bebidas";
  TextEditingController _controllerNaming = TextEditingController();
  MaterialStateProperty<Color> _colorButton = MaterialStateProperty.all<Color>(Color.fromRGBO(128, 128, 128, .7));
  Color _colorText = Colors.white;
  bool _botaoHabilitado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 125, 54, 1.0),

      //Botão flutuante
      floatingActionButton: FloatingActionButton(
        child: Icon(Mdi.help,size: 30, color: Color.fromRGBO(240, 125, 54, 1.0),),
        backgroundColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage()));
        },
      ),

      // Corpo da Página
      body: ListView(
        children: [
          Column(
            children: [

              // Container com a logo de cabeçalho
              Container(
                alignment: Alignment.centerLeft,
                //color: Color.fromRGBO(240, 54, 54, 1.0), //Remover
                height: 90,
                padding: EdgeInsets.fromLTRB(25, 30, 10, 30),
                child: Image.asset("assets/images/logo_appBar.png"),
              ),

              // Container com o texto de chama
              Container(
                alignment: Alignment.centerLeft,
                //color: Color.fromRGBO(100, 100, 100, 1), //Remover
                //height: 200,
                padding: EdgeInsets.fromLTRB(25, 50, 20, 40),
                child: Text(
                  "Vamos avaliar o nome da sua marca?",
                  style: TextStyle(
                    fontSize: 40,
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              //Container com a entrada de texto e segmento
              Container(
                alignment: Alignment.center,
                //color: Colors.blue, //Remover
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                child: Column(
                  children: [

                    // Campo de texto para o nome da marca
                    TextFormField(
                      controller: _controllerNaming,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          labelText: "Digite o noma a ser avaliado",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 3)
                          )
                      ),
                      onChanged: (value){
                        setState(() {
                          if(_controllerNaming.text.isEmpty){
                            _colorButton = MaterialStateProperty.all<Color>(Color.fromRGBO(128, 128, 128, .7));
                            _colorText = Colors.white;
                            _botaoHabilitado = false;
                          }else{
                            _colorButton = MaterialStateProperty.all<Color>(Colors.white);
                            _colorText = Color.fromRGBO(240, 125, 54, 1.0);
                            _botaoHabilitado = true;
                          }
                        });
                      },
                    ),

                    //Espaçamento
                    SizedBox(
                      height: 20,
                    ),

                    //Campo para Selecionar o segmento da marca
                    DropdownButtonFormField(
                        value: _dropdownValue,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownColor: Color.fromRGBO(128, 128, 128, .7),
                        iconDisabledColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        items: <String>['alimentos/bebidas', 'automotivo', 'bens de consumo', 'energia/combustível', 'entretenimento', 'financeiro', 'logistica', 'serviços', 'tecnologia', 'varejo']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: "Insira o segmento",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 3)
                            )
                        ),
                        onChanged: (String? newValue){
                          setState(() {
                            _dropdownValue = newValue!;
                          });
                        }
                    ),

                    //Espaçamento
                    SizedBox(
                      height: 20,
                    ),

                    //Botão para avaliar
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                              child: Text(
                                "AVALIAR",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: _colorText,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: _colorButton,
                              ),
                              onPressed: (){
                                if(_controllerNaming.text.isNotEmpty){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EvaluationPage(),
                                          settings: RouteSettings(
                                              arguments: {
                                                "name": _controllerNaming.text,
                                                "segment": _dropdownValue
                                              }
                                              )
                                      )
                                  );
                                } else{
                                  final snackBar = SnackBar(
                                    backgroundColor: Color.fromRGBO(128, 128, 128, .7),
                                    content: const Text(
                                      '!nsira os dados antes de prosseguir',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    duration: Duration(seconds: 3),
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
                              },
                            ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}