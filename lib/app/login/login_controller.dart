import 'package:login_flutter/app/login/login_model.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

enum LoginState { idle, loading, loqged, error }

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  var login = LoginModel();

  @observable
  bool showPassword = false;

  // @observable
  // LoginState loginState = LoginState.idle;

  // @observable
  // String username = "";

  // @observable
  // String password = "";

  // @action
  // void setUsername(String value) => username = value;

  // @action
  // void setPassword(String value) => password = value;

  @action
  void toggleShowPassword() => showPassword = !showPassword;

  // @action
  // void login() {
  //   loginState = LoginState.loading;
  //   Future.delayed(const Duration(seconds: 2));
  //   loginState = LoginState.loqged;
  // }
}
