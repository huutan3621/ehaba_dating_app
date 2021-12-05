

import 'dart:async';

class SignUpBLoc{
  StreamController _emailController = new StreamController();
  StreamController _passwordController = new StreamController();
  StreamController _repasswordController = new StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passwordStream => _passwordController.stream;
  Stream get repasswordStream => _repasswordController.stream;

  bool isValidInfo(String email, String password, String repassword){
    if ( email.length < 6 || !email.contains("@")){
      _emailController.sink.addError("Email không hợp lệ");
      return false;
    }
    _emailController.sink.add("OK");

    if (password.length < 6 ){
      _passwordController.sink.addError("Password phải trên 6 ký tự");
      return false;
    }
    _passwordController.sink.add("OK");

    if(password != repassword)
    {
      _repasswordController.sink.addError("Nhập lại password không trùng khớp");
      return false;
    }
    _repasswordController.sink.add("OK");

    return true;
  }

  void dispose(){
    _emailController.close();
    _passwordController.close();
    _repasswordController.close();
  }

}
