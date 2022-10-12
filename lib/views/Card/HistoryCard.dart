


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Repository/HistoryRepository.dart';
import '../../model/Historico.dart';
import '../evaluationPage/evaluation_page.dart';

class HistoryCard extends StatefulWidget {
  History history;

  HistoryCard({Key? key,required this.history}) : super(key: key);

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override

   mostrarDetalhes(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EvaluationPage(),
      settings: RouteSettings(
      arguments: {
      "name": widget.history.name,
      "segment": widget.history.segment
      }
      )
      )
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 2,
      child: InkWell(
        onTap: () => mostrarDetalhes(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left:20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children:[
                        ListTile(
                          title:
                          Text(widget.history.name, 
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(240, 125, 54, 1.0)
                    
                          ),
                            ),
                        
                        subtitle: Text("Segmento: ${widget.history.segment}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                        )
                        )
                        )
                    ]
                    ),
                    
                    
                )
                
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (context) =>[
                    PopupMenuItem(child: ListTile(
                      title: const Text("remover disciplina"),
                      onTap: (){
                        Navigator.pop(context);
                        Provider.of<HistoryRepository>(context,listen: false).remove(widget.history);
                      }
                      )
                      )
                  ]
                  )
            ]),
          )
      )
    );
  }
}