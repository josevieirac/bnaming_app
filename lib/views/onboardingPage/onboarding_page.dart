import 'dart:convert';
import 'dart:io';
import 'package:bnaming_app/model/alert.dart';
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
  bool _isChecked = false;
  int _currentPage = 0;
  MaterialStateProperty<Color> _colorButton = MaterialStateProperty.all<Color>(const Color.fromRGBO(128, 128, 128, 1));
  final List<Map<String,String>> _splashData = [
    {
      "title": "Olá,\nseja bem vindo!",
      "text": "O bNaming é o app ideal para você que está no processo de criação do nome de sua marca!",
      "image": "assets/images/slide_01.png"
    },
    {
      "title": "Avalie já o nome da sua marca!",
      "text": "Basta informar o nome que você pensou e qual o segmento de mercado que avaliamos em 10 critérios a qualidade do seu nome!",
      "image": "assets/images/slide_02.png"
    },
    {
      "title": "Não deixe de conferir a tela de ajuda!",
      "text": "Lá você encontra como funciona a avaliação, e principalmente como essa avaliação deve ser interpretada, além de várias outras informações!",
      "image": "assets/images/slide_03.png"
    }
  ];

  @override
  Widget build(BuildContext context) {

    _visible = ModalRoute.of(context)!.settings.arguments as Map;

    // Quando a tela Onboard está ativa
    if(_visible["visible"]){
      return Scaffold(
        //backgroundColor: Color.fromRGBO(240, 125, 54, 1.0),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior(),
                  child: GlowingOverscrollIndicator(
                    axisDirection: AxisDirection.right,
                    color: const Color.fromRGBO(240, 125, 54, 1.0),
                      child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            _currentPage = value;
                            if(_currentPage == 2){
                              _colorButton = MaterialStateProperty.all<Color>(const Color.fromRGBO(240, 125, 54, 1.0));
                            }else{
                              _colorButton = MaterialStateProperty.all<Color>(const Color.fromRGBO(128, 128, 128, 1));
                            }
                          });
                        },
                        itemCount: _splashData.length,
                        itemBuilder: (context, index) =>
                            SplashContent(
                              title: _splashData[index]["title"]!,
                              text: _splashData[index]["text"]!,
                              image: _splashData[index]["image"]!,
                            ),
                      ),
                  ),
                ),

              )
            ),


            Expanded(
              child: Column(
                children: [

                  const SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _splashData.length,
                      (index) => buildDot(index: index)
                    ),
                  ),

                  const SizedBox(height: 20,),
                  
                  ElevatedButton(
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: _colorButton
                    ),
                    onPressed: (){
                      _visible["visible"] = !_isChecked;
                      _saveData();
                      if(_currentPage == 2){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
                      }else{
                        Alert alerta= Alert();
                        alerta.snackBar3(context);
                      }
                    },
                  ),

                  const SizedBox(height: 8,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        activeColor: const Color.fromRGBO(240, 125, 54, 1.0),
                        value: _isChecked,
                        onChanged: (bool? value){
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      const Text(
                        "Não mostrar esta tela novamente",
                        style: TextStyle(
                          color: Color.fromRGBO(128, 128, 128, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),

          ],
        ),

      );
    }
    // Quando a tela Onboard não está ativa vai direto para a home
    return const HomePage();
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
                  duration: const Duration(microseconds: 200000),
                  margin: const EdgeInsets.only(right: 5),
                  height: 6,
                  width: _currentPage == index ? 20 : 6,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? const Color.fromRGBO(240, 125, 54, 1.0) : const Color.fromRGBO(128, 128, 128, 1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_visible);
    final file = await _getFile();
    return file.writeAsString(data);
  }

}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key, required this.title, required this.text, required this.image,
  }) : super(key: key);

  final String title, text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: Color.fromRGBO(240, 125, 54, 1.0),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          child:
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromRGBO(128, 128, 128, 1),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        const SizedBox(height: 40,),

        Image.asset(
          image,
          height: 220,
        ),
      ],
    );
  }
}