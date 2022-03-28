import 'package:flutter/material.dart';

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
                        'Lorem ipsum ut curabitur ligula nunc faucibus rhoncus vestibulum rutrum sapien varius, gravida rutrum ultrices auctor arcu malesuada auctor sapien sed hac, eleifend consectetur torquent vitae interdum aliquam himenaeos nam fringilla tincidunt. arcu tempus velit justo habitasse ultricies sem orci vivamus bibendum, class lacus magna ad vivamus curae congue sit.',
                    ),

                    createExpansionTile(
                      'Como é calculada a nota total?',
                      'Lorem ipsum ut curabitur ligula nunc faucibus rhoncus vestibulum rutrum sapien varius, gravida rutrum ultrices auctor arcu malesuada auctor sapien sed hac, eleifend consectetur torquent vitae interdum aliquam himenaeos nam fringilla tincidunt. arcu tempus velit justo habitasse ultricies sem orci vivamus bibendum, class lacus magna ad vivamus curae congue sit.',
                    ),

                    createExpansionTile(
                      'Como interpretar a avaliação?',
                      'Lorem ipsum ut curabitur ligula nunc faucibus rhoncus vestibulum rutrum sapien varius, gravida rutrum ultrices auctor arcu malesuada auctor sapien sed hac, eleifend consectetur torquent vitae interdum aliquam himenaeos nam fringilla tincidunt. arcu tempus velit justo habitasse ultricies sem orci vivamus bibendum, class lacus magna ad vivamus curae congue sit.',
                    ),

                    createExpansionTile(
                      'Porque informar o nome junto do segmento?',
                      'Lorem ipsum ut curabitur ligula nunc faucibus rhoncus vestibulum rutrum sapien varius, gravida rutrum ultrices auctor arcu malesuada auctor sapien sed hac, eleifend consectetur torquent vitae interdum aliquam himenaeos nam fringilla tincidunt. arcu tempus velit justo habitasse ultricies sem orci vivamus bibendum, class lacus magna ad vivamus curae congue sit.',
                    ),

                    createExpansionTile(
                      'Como essa avaliação pode ser útil?',
                      'Lorem ipsum ut curabitur ligula nunc faucibus rhoncus vestibulum rutrum sapien varius, gravida rutrum ultrices auctor arcu malesuada auctor sapien sed hac, eleifend consectetur torquent vitae interdum aliquam himenaeos nam fringilla tincidunt. arcu tempus velit justo habitasse ultricies sem orci vivamus bibendum, class lacus magna ad vivamus curae congue sit.',
                    ),

                    createExpansionTile(
                      'Por que avaliar o nome da minha marca?',
                      'Lorem ipsum ut curabitur ligula nunc faucibus rhoncus vestibulum rutrum sapien varius, gravida rutrum ultrices auctor arcu malesuada auctor sapien sed hac, eleifend consectetur torquent vitae interdum aliquam himenaeos nam fringilla tincidunt. arcu tempus velit justo habitasse ultricies sem orci vivamus bibendum, class lacus magna ad vivamus curae congue sit.',
                    ),

                    createExpansionTile(
                      'Quem desenvolveu o aplicativo?',
                      'Lorem ipsum ut curabitur ligula nunc faucibus rhoncus vestibulum rutrum sapien varius, gravida rutrum ultrices auctor arcu malesuada auctor sapien sed hac, eleifend consectetur torquent vitae interdum aliquam himenaeos nam fringilla tincidunt. arcu tempus velit justo habitasse ultricies sem orci vivamus bibendum, class lacus magna ad vivamus curae congue sit.',
                    ),

                    createExpansionTile(
                      'Qual o propósito do aplicativo?',
                      'Lorem ipsum ut curabitur ligula nunc faucibus rhoncus vestibulum rutrum sapien varius, gravida rutrum ultrices auctor arcu malesuada auctor sapien sed hac, eleifend consectetur torquent vitae interdum aliquam himenaeos nam fringilla tincidunt. arcu tempus velit justo habitasse ultricies sem orci vivamus bibendum, class lacus magna ad vivamus curae congue sit.',
                    ),

                    createExpansionTile(
                      'Tem alguma sugestão de melhoria para o aplicativo?',
                      'Lorem ipsum ut curabitur ligula nunc faucibus rhoncus vestibulum rutrum sapien varius, gravida rutrum ultrices auctor arcu malesuada auctor sapien sed hac, eleifend consectetur torquent vitae interdum aliquam himenaeos nam fringilla tincidunt. arcu tempus velit justo habitasse ultricies sem orci vivamus bibendum, class lacus magna ad vivamus curae congue sit.',
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(25, 40, 25, 0),
                      child: Column(
                        children: [
                          const Text(
                            "Entre em contato conosco",
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
                              Text("aa"),
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
