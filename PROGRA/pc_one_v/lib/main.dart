// search pubspec.yaml and add charts_flutter: ^0.8.1
// and path_provider: ^0.4.1.

import 'make_bar_graphic.dart';
import 'make_pie_graphic.dart';
import 'package:flutter/material.dart';

final List<StatelessWidget> items = [ StackedHorizontalBarChart.withSampleData(), PieMaker.withSampleData()];

class BasicAppBarSample extends StatefulWidget {
  @override
  _BasicAppBarSampleState createState() => _BasicAppBarSampleState();
}


class _BasicAppBarSampleState extends State<BasicAppBarSample> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('PC1'),
          actions: <Widget>[
            FlatButton.icon(
              color: Colors.green,
              icon: Icon(null), //`Icon` to display
               label: Text('Barras'), //`Text` to display3
              onPressed: () {
                _select(choices[0]);
              },
            ),
            FlatButton.icon(
              color: Colors.green,
              icon: Icon(null), //`Icon` to display
              label: Text('Burbuja'), //`Text` to display3
              onPressed: () {
                _select(choices[1]);
              },
            ),
            FlatButton.icon(
              color: Colors.green,
              icon: Icon(null), //`Icon` to display
              label: Text('Pie'), //`Text` to display3
              onPressed: () {
                _select(choices[2]);;
              },
            ),
          ],
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChoiceCard(choice: _selectedChoice),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.num});
  final int  num;
}

const List<Choice> choices = const <Choice>[
  const Choice(num: 0),
  const Choice(num: 1),
  const Choice(num: 2),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            items[choice.num],
          ],
        ),
      ),
    );
  }
}

void  main () =>  runApp ( MaterialApp (home : BasicAppBarSample()));
