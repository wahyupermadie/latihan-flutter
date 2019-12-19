import 'package:flutter/material.dart';
import 'package:my_app/component.dart';
import 'package:my_app/route/router.dart';
import 'package:my_app/route/routing_const.dart';
import 'helper.dart';

void main(){
  runApp( new MaterialApp(
    onGenerateRoute: Router.generateRoute,
    initialRoute: AuthMovies,
  ));
}

class MyApp extends StatefulWidget{
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp>{

  String _email;
  String _password;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isDataValid = false;

  void _onChangeEmail(value){
    setState(() {
      _email = value;
      _isEmailValid = validateEmail(value);
      onValidate();
    });
  }

  void _onChangePassword(value){
    setState(() {
      _password = value;   
      _isPasswordValid = validatePassword(value);
      onValidate();
    });
  }

  void onValidate(){
    _isDataValid = _isEmailValid && _isPasswordValid;
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
                ButtonLogin(
                  text : "LOGIN", 
                  isClickAble: _isDataValid,
                  onClickPopup: () {
                    showDialogPopup(
                      context: context,
                      title: "Login Anda Berhasil",
                      content: "Apakah anda akan melanjutkan ?",
                      acceptFunc: () {
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                          context, 
                          ListMovies);
                      });
                  }),
              ],
            ),
          ),
        ),
      );
  }
}