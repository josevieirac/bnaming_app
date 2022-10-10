import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mdi/mdi.dart';

class historyPage extends StatefulWidget {
  const historyPage({Key? key}) : super(key: key);

  @override
  State<historyPage> createState() => _historyPageState();
}

class _historyPageState extends State<historyPage> {
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
      child: const ListTile(
        leading: Icon(Mdi.history,size: 20, color: Color.fromRGBO(255, 255, 255, 1.0)),
        title: Text("Histórico vazio",
        style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                    fontWeight: FontWeight.w500,
                  ),
        ),
    ),
    )
    );
  }
}