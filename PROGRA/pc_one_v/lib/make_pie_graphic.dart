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
                child: charts.PieChart(seriesList, animate: true),
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
      new OrdinalScales('San Jose', 70690, charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalScales('s', 900690, charts.ColorUtil.fromDartColor(Colors.deepPurple)),
      new OrdinalScales('a', 900690, charts.ColorUtil.fromDartColor(Colors.deepOrange)),
    ];

    return [
      new charts.Series<OrdinalScales, String>(
        id: 'Data',
        domainFn: (OrdinalScales sales, _) => sales.year,
        measureFn: (OrdinalScales sales, _) => sales.subscribers,
        colorFn: (OrdinalScales sales, _) => sales.barColor,
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

