import 'dart:collection';

import 'package:bnaming_app/model/Historico.dart';
import 'package:flutter/cupertino.dart';


class CursandoRepository extends ChangeNotifier{
  List<Historico> _list=[];



  UnmodifiableListView<Historico> get Lista => UnmodifiableListView(_list);

  saveAll(List<Historico> disciplinas){
    disciplinas.forEach((disciplina) { 
        if(!_list.contains(disciplina)) _list.add(disciplina);
    });
    notifyListeners();
  }
  


  remove(Historico disciplina){
    _list.remove(disciplina);
    notifyListeners();
  }
}