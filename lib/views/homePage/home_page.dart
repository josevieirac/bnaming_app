import 'package:bnaming_app/http/RegistroBR.dart';
import 'package:bnaming_app/model/Historico.dart';
import 'package:bnaming_app/model/alert.dart';
import 'package:bnaming_app/views/evaluationPage/evaluation_page.dart';
import 'package:bnaming_app/views/helpPage/help_page.dart';
import 'package:bnaming_app/views/historyPage/historyPage.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

import '../../Repository/HistoryRepository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    // ignore: non_constant_identifier_names
    late HistoryRepository historico;

    
  Alert alert=Alert();
  String _dropdownValue = "alimentos/bebidas";
  final TextEditingController _controllerNaming = TextEditingController();
  MaterialStateProperty<Color> _colorButton = MaterialStateProperty.all<Color>(const Color.fromRGBO(128, 128, 128, 1));
  Color _colorText = Colors.white;

  @override
  Widget build(BuildContext context) {
    historico = context.watch<HistoryRepository>();
    historico.getAll();
    historico.setAll();
    bool registrado=false;
    final RBR _api = RBR();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 125, 54, 1.0),

      

      //Botão flutuante
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'next1',
              child: const Icon(Mdi.help,size: 30, color: Color.fromRGBO(240, 125, 54, 1.0),),
              backgroundColor: Colors.white,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpPage()));
              },
            ),
            Expanded(child: Container()),
            FloatingActionButton(
              heroTag: 'next2',
              child: const Icon(Mdi.history,size: 30, color: Color.fromRGBO(240, 125, 54, 1.0),),
              backgroundColor: Colors.white,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const historyPage()));
              },
            ), 
          ],
        ),
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
                padding: const EdgeInsets.fromLTRB(25, 30, 10, 30),
                child: Image.asset("assets/images/logo_appBar.png"),
              ),

              // Container com o texto de chama
              Container(
                alignment: Alignment.centerLeft,
                //color: Color.fromRGBO(100, 100, 100, 1), //Remover
                //height: 200,
                padding: const EdgeInsets.fromLTRB(25, 50, 20, 40),
                child: const Text(
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
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                child: Column(
                  children: [

                    // Campo de texto para o nome da marca
                    TextFormField(
                      controller: _controllerNaming,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                          labelText: "Digite o nome a ser avaliado",
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
                            _colorButton = MaterialStateProperty.all<Color>(const Color.fromRGBO(128, 128, 128, 1));
                            _colorText = Colors.white;
                          }else{
                            _colorButton = MaterialStateProperty.all<Color>(Colors.white);
                            _colorText = const Color.fromRGBO(240, 125, 54, 1.0);
                          }
                        });
                      },
                    ),

                    //Espaçamento
                    const SizedBox(
                      height: 20,
                    ),

                    //Campo para Selecionar o segmento da marca
                    DropdownButtonFormField(
                        value: _dropdownValue,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        dropdownColor: const Color.fromRGBO(128, 128, 128, 1),
                        iconDisabledColor: Colors.white,
                        iconEnabledColor: Colors.white,
                        items: <String>['alimentos/bebidas', 'automotivo', 'bens de consumo', 'energia/combustível', 'entretenimento', 'financeiro', 'logistica', 'serviços', 'tecnologia', 'varejo']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
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
                    const SizedBox(
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
                              onPressed: () async {
                                 var  registrado =_api.getAPI(_controllerNaming.text);
                                 bool registro = await registrado;
                                
                                if(registro){
                                    alert.snackBar1(context);  
                                } 
                                History history = History(name:_controllerNaming.text , segment:_dropdownValue );
                                historico.saveAll(history);
                                if(_controllerNaming.text.isNotEmpty){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const EvaluationPage(),
                                          settings: RouteSettings(
                                              arguments: {
                                                "name": _controllerNaming.text,
                                                "segment": _dropdownValue
                                              }
                                              )
                                      )
                                  );
                                } else{
                                  alert.snackBar2(context);
                                }
                              
                              }
                            )
                        ),
                           
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