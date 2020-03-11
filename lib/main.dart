// search pubspec.yaml and add charts_flutter: ^0.8.1
// and path_provider: ^0.4.1
import 'package:flutter/material.dart';
import 'bar_graphic.dart';
import 'pie_chart.dart';


void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text("PROYECTO CORTO UNO"),
    centerTitle: true,
    ),
    body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: createButtons(context, Colors.cyan, [
            ["Bars", BarGraphicPage()],
            ["Bubbles"],
            ["Glifo", PieChartPage()],
          ])
      ),
    ),
    );
}



  List<Widget> createButtons(BuildContext context, Color color ,List<dynamic> buttonsInfo){
    List<Widget> ret = new List<Widget>();
    for(List button in buttonsInfo){
      ret.add(FlatButton(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(button[0], textScaleFactor: 2, style: TextStyle(color: Colors.white),),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => button[1]));
        },
      )
      );
    }
    return ret;
  }
}




