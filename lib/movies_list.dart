import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/component.dart';

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
    return new WillPopScope(
      onWillPop: () async {
        showDialogPopup(
          context: context, 
          title: "Keluar Aplikasi", 
          content: "Apakah anda yakin keluar aplikasi ?", 
          acceptFunc: () => Navigator.pop(context)
        );
        return false;
      },
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("Movies"),
        ),
        body: new Container(
          margin: new EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}