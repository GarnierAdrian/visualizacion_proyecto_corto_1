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
    return Container(
      height: 500,
      padding: EdgeInsets.all(10),// margen
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "CENSO 2011: PERSONAS CON DISCAPACIDAD TIPIFICADO POR SEXO Y PROVINCIA",
                style: Theme.of(context).textTheme.body2
              ),
              Expanded(
                child:
                charts.BarChart(seriesList, animate: true,
                      barGroupingType: charts.BarGroupingType.stacked,
                      vertical: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalScales, String>> _createSampleData() {
    final HombreData = [
      // new OrdinalSales('Costa Rica',218395,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalScales('San Jose',70690,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalScales('Cartago',21716,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalScales('Heredia',20589,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalScales('Alajuela',41867,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalScales('Guanacaste',17517,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalScales('Limon',22216,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalScales('Puntarenas',23800,charts.ColorUtil.fromDartColor(Colors.green)),
    ];

    final MujerData = [
      // new OrdinalSales('Costa Rica',234454,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalScales('San Jose',84959,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalScales('Cartago',23196,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalScales('Heredia',22576,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalScales('Alajuela',41999,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalScales('Guanacaste',18130,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalScales('Limon',21075,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalScales('Puntarenas',22519,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
    ];

    return [
      new charts.Series<OrdinalScales, String>(
        id: 'Hombre',
        domainFn: (OrdinalScales sales, _) => sales.year,
        measureFn: (OrdinalScales sales, _) => sales.sales,
        colorFn: (OrdinalScales sales, _) => sales.color,
        data: HombreData,
      ),
      new charts.Series<OrdinalScales, String>(
        id: 'Mujer',
        domainFn: (OrdinalScales sales, _) => sales.year,
        measureFn: (OrdinalScales sales, _) => sales.sales,
        colorFn: (OrdinalScales sales, _) => sales.color,
        data: MujerData,
      ),
    ];
  }

}

class OrdinalScales {
  final String year;
  final int sales;
  final charts.Color color;
  OrdinalScales(this.year, this.sales,this.color);
}
