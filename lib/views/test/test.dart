import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {

  List<charts.Series<int, String>> data = [
    charts.Series<int, String>(
      id: "Gráfico",
      data: [1],                                                                  // COLOCAR NOTA AQUI
      domainFn: (int n,_) => n.toString(),
      measureFn: (int n, _) => n,
      colorFn: (_, __) => charts.Color.fromHex(code: '#F27E35'),
      measureLowerBoundFn: (int n, __) => 0,
      measureUpperBoundFn: (int n, __) => 5,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          height: 150,
          width: 400,
          padding: EdgeInsets.all(20),
          child: charts.BarChart(
            data,
            animate: true,
            vertical: false,
            //charts.NumericAxisSpec(showAxisLine: false, renderSpec: charts.NoneRenderSpec()),
            domainAxis: charts.OrdinalAxisSpec(showAxisLine: false, renderSpec: charts.NoneRenderSpec()),
            primaryMeasureAxis: charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
          ),
        ),
      ),
    );
  }
}


/*
charts.BarChart(
                data,
                animate: true,
                vertical: false,
                //charts.NumericAxisSpec(showAxisLine: false, renderSpec: charts.NoneRenderSpec()),
                domainAxis: charts.OrdinalAxisSpec(showAxisLine: false, renderSpec: charts.NoneRenderSpec()),
                primaryMeasureAxis: charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
              ),
 */