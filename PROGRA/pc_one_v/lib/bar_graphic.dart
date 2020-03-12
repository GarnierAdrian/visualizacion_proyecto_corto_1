import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedHorizontalBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedHorizontalBarChart(this.seriesList, {this.animate});

  factory StackedHorizontalBarChart.withSampleData() {
    return new StackedHorizontalBarChart(
      _createSampleData(),
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("GRAFICO DE BARRAS"),
        centerTitle: true,
      ),
      body: Center (
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Costa Rica: Población por provincia y sexo que presenta alguna discapacidad ",
                  style: Theme.of(context).textTheme.body2,
                ),
                Expanded(
                  child: charts.BarChart(seriesList, animate: true,
                      barGroupingType: charts.BarGroupingType.stacked,
                      vertical: true),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final Hombre = [
     // new OrdinalSales('Costa Rica',218395,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalSales('San Jose',70690,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalSales('Cartago',21716,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalSales('Heredia',20589,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalSales('Alajuela',41867,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalSales('Guanacaste',17517,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalSales('Limon',22216,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalSales('Puntarenas',23800,charts.ColorUtil.fromDartColor(Colors.green)),
    ];

    final Mujer = [
     // new OrdinalSales('Costa Rica',234454,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalSales('San Jose',84959,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalSales('Cartago',23196,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalSales('Heredia',22576,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalSales('Alajuela',41999,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalSales('Guanacaste',18130,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalSales('Limon',21075,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalSales('Puntarenas',22519,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
    ];


    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Hombre',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (OrdinalSales sales, _) => sales.color,
        data: Hombre,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mujer',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (OrdinalSales sales, _) => sales.color,
        data: Mujer,
      ),
    ];
  }


}

class OrdinalSales {
  final String year;
  final int sales;
  final charts.Color color;
  OrdinalSales(this.year, this.sales,this.color);
}
