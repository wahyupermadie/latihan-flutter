import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(
    new MaterialApp(
      home: SecondApp(),
    )
  );
}

class SecondApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<SecondApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Page"),
      ),
      body: new Container(
        margin: new EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Hahahaha")
            ],
          ),
        ),
      ),
    );
  }
  
}