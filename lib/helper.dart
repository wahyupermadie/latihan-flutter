
var _emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

bool validateEmail(email){
  return _emailValidator.hasMatch(email);
}

bool validatePassword(password){
  return password.toString().length >= 8 ? true : false;
}