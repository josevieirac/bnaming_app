import 'package:bnaming_app/model/Historico.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Repository/HistoryRepository.dart';
import '../Card/HistoryCard.dart';

class historyPage extends StatefulWidget {
  const historyPage({Key? key}) : super(key: key);

  @override
  State<historyPage> createState() => _historyPageState();
}

class _historyPageState extends State<historyPage> {
  List<History> historyList=[];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
                 appBar: AppBar(
              title: const Text(
                "Histórico",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromRGBO(240, 125, 54, 1.0),
            ),
    body: Container(
     color:  const Color.fromRGBO(240, 125, 54, 1.0).withOpacity(0.7),
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(12.0),
      child: 
      Consumer<HistoryRepository>(
          builder: (context,historyList,child ) {
            return historyList.Lista.isEmpty
            ?const ListTile(
              leading: Icon(Icons.history),
              title: Text("historico vazio"),
            )
            : SizedBox(
              child: ListView.builder( 
                
                itemCount: historyList.Lista.length,
                itemBuilder: (_,index){
                  historyList.invert();
                  return HistoryCard(history: historyList.Lista[index]);
                },
                
                
                ),
            );
          }
          ) ,
        ),
    );
    
    
  }
}