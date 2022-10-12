import 'dart:collection';

import 'package:bnaming_app/model/Historico.dart';
import 'package:flutter/cupertino.dart';


class HistoryRepository extends ChangeNotifier{
  List<History> _list=[];



  UnmodifiableListView<History> get Lista => UnmodifiableListView(_list);

  saveAll(History history){
    
    if(!_list.contains(history)) _list.add(history);
    
    notifyListeners();
  }
  
  remove(History history){
    _list.remove(history);
    notifyListeners();
  }
}