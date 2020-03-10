import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'data_model.dart';
import 'create_bar_graphic.dart';

//define how the bar chart will be constructed

class BarMaker extends StatelessWidget {
  final List<DataModel> data;
  BarMaker({@required this.data});

  @override
  Widget build(BuildContext context) {

    // data for charts.BarChart
    List<charts.Series<DataModel, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (DataModel series, _) => series.year,
          measureFn: (DataModel series, _) => series.subscribers,
          colorFn: (DataModel series, _) => series.barColor)
    ];

    return Container(
      height: 500,
      padding: EdgeInsets.all(10),// margen
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "CENSO 2011",
                style: Theme.of(context).textTheme.body2,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}