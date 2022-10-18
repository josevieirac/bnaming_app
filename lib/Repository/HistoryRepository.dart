import 'dart:collection';
import 'dart:convert';

import 'package:bnaming_app/model/Historico.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HistoryRepository extends ChangeNotifier{
  List<History> _list=[];



  UnmodifiableListView<History> get Lista => UnmodifiableListView(_list);

  saveAll(History history) async{
    
    if(!_list.contains(history)) _list.insert(0, history);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("history",json.encode(history.toJson()));
    notifyListeners();
  }
  
  remove(History history){
    _list.remove(history);
    notifyListeners();
  }

  int tamanho() {
    int tam =_list.length;
    if(tam<20){
        return tam;
    }else{
        return 20;
    }
            
    }
}