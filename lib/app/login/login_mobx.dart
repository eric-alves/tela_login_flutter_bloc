import 'package:mobx/mobx.dart';

class LoginMobx {
  var _username = Observable('');
  var _password = Observable('');
  var _showPassword = Observable(false);

  String get username => _username.value;
  String get password => _password.value;
  bool get showPassword => _showPassword.value;

  set username(String newUsername) => _username.value = newUsername;
  set password(String newPassword) => _password.value = newPassword;
  set showPassword(_) => _showPassword.value = !showPassword;

  late Action usernameValidation;
  late Action passwordValidation;
  late Action toggleShowPassword;

  LoginMobx() {
    usernameValidation = Action(_usernameValidation);
    passwordValidation = Action(_passwordValidation);
    toggleShowPassword = Action(_toggleShowPassword);

    autorun((_) {
      print(username);
    });
  }

  _usernameValidation() {}

  _passwordValidation() {}

  _toggleShowPassword() {}
}
