import 'dart:ffi';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

//define how the pie chart will be constructed

class BubbleMaker extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  BubbleMaker(this.seriesList, {this.animate});
  factory BubbleMaker.withSampleData() {
    return new BubbleMaker(
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
                child:charts.ScatterPlotChart(seriesList, animate: animate,

                )
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalScales, int>> _createSampleData() {
    final CData = [
// new OrdinalSales('Costa Rica',218395,charts.ColorUtil.fromDartColor(Colors.green)),
      new OrdinalScales(0, 5, 3.0),
      new OrdinalScales(10, 25, 3.0),
      new OrdinalScales(12, 75, 2.0)
    ];

    return [
      new charts.Series<OrdinalScales, int>(
        id: 'Data',
        domainFn: (OrdinalScales sales, _) => sales.x,
        measureFn: (OrdinalScales sales, _) => sales.y,
        radiusPxFn: (OrdinalScales sales, _) => sales.size,
        data: CData,
      ),
    ];
  }

}

class OrdinalScales {
  final int x;
  final int y;
  final double size;
  OrdinalScales(this.x,this.y,this.size);
}

