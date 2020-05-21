import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

//define how the pie chart will be constructed

class PieMaker extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PieMaker(this.seriesList, {this.animate});
  factory PieMaker.withSampleData() {
    return new PieMaker(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.all(10), // margen
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "CENSO 2011",
                style: Theme
                    .of(context)
                    .textTheme
                    .body2,
              ),
              Expanded(
                child:charts.PieChart(seriesList,
                  animate: animate,
                  defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
                    new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.auto)
                  ])),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalScales, String>> _createSampleData() {
    final CData = [
// new OrdinalSales('Costa Rica',218395,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalScales('San José', 205526, charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent)),
      new OrdinalScales('Cartago', 58970, charts.ColorUtil.fromDartColor(Colors.blue)),
      new OrdinalScales('Alajuela', 113462, charts.ColorUtil.fromDartColor(Colors.red)),
      new OrdinalScales('Heredia', 55124, charts.ColorUtil.fromDartColor(Colors.yellow)),
      new OrdinalScales('Puntarenas', 57845, charts.ColorUtil.fromDartColor(Colors.orange)),
      new OrdinalScales('Guanacaste', 48566, charts.ColorUtil.fromDartColor(Colors.brown)),
      new OrdinalScales('Limón', 57845, charts.ColorUtil.fromDartColor(Colors.green)),

    ];

    return [
      new charts.Series<OrdinalScales, String>(
        id: 'Data',
        domainFn: (OrdinalScales sales, _) => sales.year,
        measureFn: (OrdinalScales sales, _) => sales.subscribers,
        colorFn: (OrdinalScales sales, _) => sales.barColor,
        labelAccessorFn: ( OrdinalScales row, _) => '${row.year}',
        data: CData,
      ),
    ];
  }

}

class OrdinalScales {
  final String year;
  final int subscribers;
  final charts.Color barColor;
  OrdinalScales(this.year,this.subscribers,this.barColor);
}

