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

  @computed
  bool get isValid {
    return (validateUsername() == null && validatePassword() == null);
  }

  String? validateUsername() {
    if (username.length < 6) {
      return "Nome de usuário deve ter mais que 5 caracteres";
    } else {
      return null;
    }
  }

  String? validatePassword() {
    if (password.length < 4) {
      return "A senha deve conter mais que 3 caracteres";
    } else {
      return null;
    }
  }
}
