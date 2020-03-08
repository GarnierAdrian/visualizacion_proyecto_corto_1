// search pubspec.yaml and add charts_flutter: ^0.8.1
// and path_provider: ^0.4.1
import 'package:flutter/material.dart';
import 'bar_graphic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarGraphicPage(),
    );
  }
}