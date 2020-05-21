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
                child:charts.ScatterPlotChart(seriesList,
                  behaviors: [
                    new charts.SeriesLegend(position: charts.BehaviorPosition.start
                      ,          horizontalFirst: false,),

                  ],

                  animate: animate,

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
    final sanjose = [
      new OrdinalScales(53, 205526, 15.0,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
    ];
    final alajuela = [
      new OrdinalScales(53, 113462, 15.0,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
    ];
    final cartago = [
      new OrdinalScales(52, 58970, 15.0,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
    ];
    final heredia = [
      new OrdinalScales(52, 58970, 15.0,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
    ];
    final guanacaste = [
      new OrdinalScales(54, 48566, 15.0,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
    ];
    final puntarenas = [
      new OrdinalScales(53, 63719, 15.0,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
    ];
    final limon = [
      new OrdinalScales(51, 57845, 15.0,charts.ColorUtil.fromDartColor(Colors.deepPurple)),
    ];


    return [
      new charts.Series<OrdinalScales, int>(
        id: 'San José',
        colorFn: (OrdinalScales sales, _) => sales.color,
        domainFn: (OrdinalScales sales, _) => sales.x,
        measureFn: (OrdinalScales sales, _) => sales.y,
        radiusPxFn: (OrdinalScales sales, _) => sales.size,
        data: sanjose,
      ),
      new charts.Series<OrdinalScales, int>(
        id: 'Alajuela',
        colorFn: (OrdinalScales sales, _) => sales.color,
        domainFn: (OrdinalScales sales, _) => sales.x,
        measureFn: (OrdinalScales sales, _) => sales.y,
        radiusPxFn: (OrdinalScales sales, _) => sales.size,
        data: alajuela,
      ),
      new charts.Series<OrdinalScales, int>(
        id: 'Cartago',
        colorFn: (OrdinalScales sales, _) => sales.color,
        domainFn: (OrdinalScales sales, _) => sales.x,
        measureFn: (OrdinalScales sales, _) => sales.y,
        radiusPxFn: (OrdinalScales sales, _) => sales.size,
        data: cartago,
      ),
      new charts.Series<OrdinalScales, int>(
        id: 'Heredia',
        colorFn: (OrdinalScales sales, _) => sales.color,
        domainFn: (OrdinalScales sales, _) => sales.x,
        measureFn: (OrdinalScales sales, _) => sales.y,
        radiusPxFn: (OrdinalScales sales, _) => sales.size,
        data: heredia,
      ),
      new charts.Series<OrdinalScales, int>(
        id: 'Puntarenas',
        colorFn: (OrdinalScales sales, _) => sales.color,
        domainFn: (OrdinalScales sales, _) => sales.x,
        measureFn: (OrdinalScales sales, _) => sales.y,
        radiusPxFn: (OrdinalScales sales, _) => sales.size,
        data: puntarenas,
      ),
      new charts.Series<OrdinalScales, int>(
        id: 'Guanacaste',
        colorFn: (OrdinalScales sales, _) => sales.color,
        domainFn: (OrdinalScales sales, _) => sales.x,
        measureFn: (OrdinalScales sales, _) => sales.y,
        radiusPxFn: (OrdinalScales sales, _) => sales.size,
        data: guanacaste,
      ),
      new charts.Series<OrdinalScales, int>(
        id: 'Limón',
        colorFn: (OrdinalScales sales, _) => sales.color,
        domainFn: (OrdinalScales sales, _) => sales.x,
        measureFn: (OrdinalScales sales, _) => sales.y,
        radiusPxFn: (OrdinalScales sales, _) => sales.size,
        data: limon,
      ),
    ];
  }

}

class OrdinalScales {
  final int x;
  final int y;
  final double size;
  final charts.Color color;
  OrdinalScales(this.x,this.y,this.size,this.color);
}

