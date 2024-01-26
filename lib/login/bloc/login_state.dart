import 'package:captcha_code_demo/login/model/login_model.dart';

abstract class LoginState{}

class LoginInitialState extends LoginState{}

class LoginSuccessfulState extends LoginState{
  LoginResponse? response;

  LoginSuccessfulState(this.response);
}

class LoginFailedState extends LoginState{
  final String error;
  LoginFailedState(this.error);
}