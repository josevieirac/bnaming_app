import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

  Widget createExpansionTile(String title, String text){
    return ExpansionTile(
      title: Text(title),
      textColor: const Color.fromRGBO(240, 125, 54, 1.0),
      iconColor: const Color.fromRGBO(240, 125, 54, 1.0),
      collapsedTextColor: const Color.fromRGBO(128, 128, 128, 1),
      collapsedIconColor: const Color.fromRGBO(128, 128, 128, 1),
      children: <Widget>[
        ListTile(
          title: Text(text),
          textColor: const Color.fromRGBO(128, 128, 128, 1),
        ),
      ],
    );
  }

  Future openBrowserURL({required String url, bool inApp = false}) async{

    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: inApp,
        enableJavaScript: true,
        forceWebView: inApp,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Configurando App Bar
      appBar: AppBar(
        title: const Text(
          "Informações",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(240, 125, 54, 1.0),
      ),

      //Configurando corpo da página
      body: Column(
        children: [
          Expanded(
            child:   ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: const Color.fromRGBO(128, 128, 128, 1),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [

                    createExpansionTile(
                        'Como é feita a avaliação?',
                        'A avaliação dos nomes é feita através de modelos de aprendizagem de máquina(inteligência artificial) utilizando redes neurais, treinadas por especialistas para o propósito específico de avaliar nomes de marcas, considerando o nome e o seu segmento de mercado. Os modelos foram treinados em uma base de dados própria, onde especialistas rotularam avaliações de vários nomes e os modelos foram treinados e testados com base nesses dados. A avaliação é realizada em 10 critérios distintos, onde para cada critério é atribuída uma nota entre 1 e 5.'
                    ),

                    createExpansionTile(
                      'Como é calculada a nota total?',
                      'A nota total informada pela avaliação do nome é formada através da média das notas dos 10 critérios avaliados. Assim teremos também uma nota entre 1 e 5 para a avaliação total do nome.'
                    ),

                    createExpansionTile(
                      'Como interpretar a avaliação?',
                      'A avaliação deve ser interpretada de forma a agregar mais argumentos no seu processo de decisão do nome da marca. A nota total não deve ser tida como um fator determinístico para a escolha do nome, você deve principalmente avaliar os critérios e considerar o que é mais relevante para o nome que você busca. Não necessariamente uma nota baixa em algum critério quer dizer que o nome seja ruim. Por exemplo, se você tem uma marca onde deseja um nome popular, você deve pontuar bem em popularidade, mas o critério de originalidade vai ser baixo, pois são pontos inversos.'
                    ),

                    createExpansionTile(
                      'Porque informar o nome junto do segmento?',
                      'É importante informar o segmento, pois isso pode influenciar na qualidade do nome para um determinado nicho do mercado. Pois um nome que é bom em um contexto, pode não ser tão bom em outro, dessa forma consideramos esse cenário, e um nome pode ter variações de nota a depender do segmento de mercado que for avaliado.'
                    ),

                    createExpansionTile(
                      'Como essa avaliação pode ser útil?',
                      'Ter em mãos a possibilidade de uma avaliação como essa, pode auxiliar bastante a você ponderar as alternativas de nome que está considerando para a sua marca, avaliando vários critérios técnicos além da sua opinião e gosto pessoal. Favorecendo assim uma tomada de decisão mais inteligente e fundamentada em mais argumentos.'
                    ),

                    createExpansionTile(
                      'Por que avaliar o nome da minha marca?',
                      'A avaliação pode lhe dar informações e argumentos que vão além do seu ponto de vista, assim podendo lhe auxiliar tendo mais informações para considerar na escolha do nome. É fundamental que considere e avalie como cada um dos critérios podem ser relevantes para a sua marca, e tente uma pontuação mais alta nos critérios que você julga mais importantes.'
                    ),

                    createExpansionTile(
                      'Quem desenvolveu o aplicativo?',
                      'O aplicativo foi desenvolvido através de uma parceria entre a UFAPE através do seu laboratório BCC Coworking em conjunto com a Agência Believe Marketing Digital. Onde uniu especialistas em Naming(serviço onde se é atribuído o nome em marcas) e profissionais da computação, que fundiram os conhecimentos em vista do desenvolvimento dessa tecnologia.'
                    ),

                    createExpansionTile(
                      'Qual o propósito do aplicativo?',
                      'O propósito do aplicativo é auxiliar você no processo de criação e escolha do nome de sua marca. Tornando acessível conhecimentos e serviços para que possamos fomentar a construção de marcas mais fortes e funcionais no mercado.'
                    ),

                    createExpansionTile(
                      'Tem alguma sugestão de melhoria para o aplicativo?',
                      'Qualquer crítica, sugestão, opinião e comentários são sempre bem vindos, então não abra mão de entrar em contato conosco para que possamos melhorar ainda mais essa solução. Abaixo você encontrará nosso site, rede social e e-mail, onde pode entrar em contato conosco. Aguardamos seu contato!'
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(25, 40, 25, 15),
                      child: Column(
                        children: [
                          const Text(
                            "Entre em contato conosco:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(240, 125, 54, 1.0),
                            ),
                          ),

                          const SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              ElevatedButton(
                                onPressed: () async {
                                  const url = 'https://agenciabelieve.com/';
                                  openBrowserURL(url:url, inApp: false);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(240, 125, 54, 1.0),
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                ),
                                child: Icon(
                                  Mdi.desktopMac,
                                  size: 35,
                                ),
                              ),

                              SizedBox(width: 30,),

                              ElevatedButton(
                                onPressed: () async {
                                  const url = 'https://www.instagram.com/agenciabelieve_/';
                                  openBrowserURL(url:url, inApp: false);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(240, 125, 54, 1.0),
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                ),
                                child: Icon(
                                  Mdi.instagram,
                                  size: 35,
                                ),
                              ),

                              SizedBox(width: 30,),

                              ElevatedButton(
                                onPressed: () async {
                                  const url = 'mailto:contato@agenciabelieve.com?subject=Contato bNaming&body=Olá, vim pelo aplicativo bNaming!';
                                  openBrowserURL(url:url, inApp: false);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(240, 125, 54, 1.0),
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                ),
                                child: Icon(
                                  Mdi.emailOutline,
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
