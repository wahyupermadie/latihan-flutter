import 'package:flutter/material.dart';

void main(){
  runApp( new MaterialApp(
    home: new MyApp()
  ));
}

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp>{

  var _value = "Hello Bro";

  void _onPressed(){
    setState(() {
      _value = "Hello Coyy";
    });
  }
  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Main Application"),
        ),
        body: new Container(
          margin: new EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(_value),
                new RaisedButton(onPressed: _onPressed, child: new Text("Submit"),)
              ],
            ),
          ),
        ),
      );
  }
}