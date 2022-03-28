import 'package:bnaming_app/http/client.dart';
import 'package:bnaming_app/views/helpPage/help_page.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({Key? key}) : super(key: key);

  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {

  late Map _dados;
  final ClientHttp _api = ClientHttp();

  @override
  Widget build(BuildContext context) {

    _dados = ModalRoute.of(context)!.settings.arguments as Map;
    Future<Map> _avaliacao = _api.postAPI(_dados["name"], _dados["segment"]);

    //final Future<String> _calculation = Future<String>.delayed(const Duration(seconds: 1000), () => 'Data Loaded');

    // Criando WIDGET para condicionar a tela entre, carregando, erro e quando tudo ocorrer bem
    return FutureBuilder(
      future: _avaliacao, // Setando variável condicional para o fluxo de telas
      builder: (context, snapshot) {
        late Widget children;

        // Quando é carregado a avaliação com sucesso, vamos para essa tela
        if (snapshot.hasData) { // Se está tudo ok
          print("TUDO OK");
          children = Scaffold(
            // Configurando App Bar
            appBar: AppBar(
              title: const Text(
                "Avaliação",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromRGBO(240, 125, 54, 1.0),
            ),

            //Botão flutuante
            floatingActionButton: FloatingActionButton(
              child: const Icon(Mdi.help,size: 30, color: Colors.white,),
              backgroundColor: Color.fromRGBO(240, 125, 54, 1.0),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpPage()));
              },
            ),

            // Corpo da página
            body: Container(
              child: Column(
                children:  [
                  // Configurando o cabeçalho estático da página
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Colocando o nome avaliado
                        Text(
                          _dados["name"],
                          style: const TextStyle(
                            color: Color.fromRGBO(240, 125, 54, 1.0),
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        //Espaçamento
                        const SizedBox(height: 5,),
                        // Colocando o segmento do nome avaliado
                        Text(
                          _dados["segment"],
                          style: const TextStyle(
                            color: Color.fromRGBO(128, 128, 128, .7),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //Espaçamento
                        const SizedBox(height: 10,),

                        const Divider(
                          color: Color.fromRGBO(128, 128, 128, .7),
                        ),
                      ],
                    ),
                  ),

                  // Configurando a lista de avaliação
                  Expanded(
                    child:   ScrollConfiguration(
                      behavior: const ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: Color.fromRGBO(128, 128, 128, .7),
                        child: ListView(
                          children: [

                            // Corpo com as avaliações de cada critério
                            Text("data")

                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              )
            ),
          );
          
        // Quando há algum erro no carregamento, vamos para essa tela
        } else if (snapshot.hasError){ // Se tiver erro
          print("ERRO");
          children = Scaffold(
            backgroundColor: const Color.fromRGBO(240, 125, 54, 1.0),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    size: 120,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5,),
                  const Text(
                    "ATENÇÃO!",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 15,),
                  const Text(
                    "Serviço temporariamente indispoível.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Tente novamente mais tarde.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    child: const Text(
                      "VOLTAR",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(240, 125, 54, 1.0),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),

                ],
              ),
            ),
          );

        // Enquanto está carregando a responta, vamos para essa tela
        } else { // Enquanto carrega
          print("CARREGANDO");
          children = Scaffold(
            body: Container(
              color: const Color.fromRGBO(240, 125, 54, 1.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      child: CircularProgressIndicator(color: Colors.white,),
                      width: 60,
                      height: 60,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Realizando avaliação...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return children;
      },
    );
  }
}