import 'dart:convert';
import 'package:http/http.dart' as http;

//Criando classe para requisições HTTP
class ClientHttp {

  // Definindo URL base para requisições da API
  String urlBase = "https://bnaming-api.herokuapp.com"; //URL para API no Heroku
  //String urlBase = "http://192.168.18.155:5000"; //URL para API em localhost

  //Método GET para requisitar a API e verificar se está funcionando
  Future<Map> getAPI() async{
    
    // Definindo URL para requisição na API do método GET
    var request = Uri.parse(urlBase+"/evaluation");

    // Realizando a requisição
    http.Response response = await http.get(request);

    // Convertendo dados para JSON
    var dado = json.decode(response.body);
    print("Executando método GET na rota /evaluation");
    print(dado);

    return dado;
  }

  //Método POST para requisitar a API e avaliar o nome passado como parametro
  Future<Map> postAPI(String nome, String segmento) async{

    //Criando JSON para enviar na requisição
    Map dadosInput = {
      "nome":nome,
      "segmento":segmento
    };

    //Convertendo em JSON
    var dados = json.encode(dadosInput);

    // Definindo URL para requisição na API do método POST
    var request = Uri.parse(urlBase+"/evaluation");

    // Realizando a requisição
    http.Response response = await http.post(request,body: dados);

    // Convertendo dados para JSON
    var dado = json.decode(response.body);

    print("Executando método POST na rota /evaluation");
    print(dado);

    return dado;
  }

}