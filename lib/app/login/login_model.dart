import 'package:mobx/mobx.dart';

part 'login_model.g.dart';

class LoginModel = _LoginModel with _$LoginModel;

abstract class _LoginModel with Store {
  @observable
  String username = "";

  @observable
  String password = "";

  @action
  void setUsername(String value) => username = value;

  @action
  void setPassword(String value) => password = value;
}
