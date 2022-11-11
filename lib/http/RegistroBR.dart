import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class RBR{


  Future<bool> getAPI(String nome) async{

   var  url = 'https://rdap.registro.br/domain/$nome.com.br';
   var response = await http.get(Uri.parse(url));
    print("Executando método GET na rota registroBR");
    print(response.statusCode);
    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }
  
   
  }
  
    

    


   
  
}