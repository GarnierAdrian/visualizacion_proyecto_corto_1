import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

// model that must have each row of data to extract

class DataModel {
  final String year;
  final int subscribers;
  final charts.Color barColor;

  DataModel(
      {@required this.year,
        @required this.subscribers,
        @required this.barColor});
}