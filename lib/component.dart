import 'package:flutter/material.dart';

void showDialogPopup({context, title, content, acceptFunc}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(title),
        content: new Text(content),
        actions: <Widget>[
          new RaisedButton(
            child: new Text(
              "Submit",
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onPressed: acceptFunc,
          ),
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class ButtonLogin extends StatefulWidget  {
  final String text;
  final bool isClickAble;
  final Function onClickPopup;
  
  ButtonLogin({this.text, this.isClickAble, this.onClickPopup});

  @override
  ButtonState createState() => new ButtonState();
}

class ButtonState extends State<ButtonLogin> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),
      child: new SizedBox(
        width: double.infinity,
        child: new RaisedButton(
          color: Colors.blue,
          onPressed: widget.isClickAble ? widget.onClickPopup : null, 
          child: new Text(
            widget.isClickAble ? widget.text : "Data Belum Lengkap",
            style: new TextStyle(
              fontSize: 16.0
            ),
            )
          )
      )
    );
  }
}