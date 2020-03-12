import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'make_bar_graphic.dart';


class BarGraphicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("GRAFICO DE BARRAS"),
        centerTitle: true,
      ),
      body: Center(
          child:StackedHorizontalBarChart.withSampleData(),
      ),
    );
  }
}