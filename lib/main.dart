import 'package:flutter/material.dart';
import 'movies_list.dart';

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
  String _email;
  String _password;
  bool _isEmailValid = true;

  var emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  void _onPressed(){
    setState(() {
      _value = _password;
    });
  }

  void _onChangeEmail(value){
    setState(() {
      _email = value;
      _isEmailValid = emailValidator.hasMatch(value);
    });
  }

  void _onChangePassword(value){
    setState(() {
      _password = value;    
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
                new Padding(
                  padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),
                  child: new TextField(
                    onChanged: _onChangeEmail,
                    decoration: new InputDecoration(
                      errorText: !_isEmailValid ? "Email Format Salah" : null,
                      labelText: "Input Email",
                      hintText: "Masukan email anda",
                      icon: new Icon(Icons.email)
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),
                  child: new TextField(
                    onChanged: _onChangePassword,
                    obscureText: true,
                    decoration: new InputDecoration(
                      labelText: "Input Password",
                      hintText: "Masukan password anda",
                      icon: new Icon(Icons.lock)
                    ),
                  ),
                ),
                _Button(
                  text : "Click Gue", 
                  onClick : (state) {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => SecondApp()));
              })
              ],
            ),
          ),
        ),
      );
  }
}

class _Button extends StatelessWidget  {

  final String text;
  final Function onClick;

  _Button({this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),
      child: new SizedBox(
        width: double.infinity,
        child: new RaisedButton(onPressed: onClick, child: new Text(text))
      )
    );
  }
}