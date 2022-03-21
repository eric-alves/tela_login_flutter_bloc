import 'package:flutter/material.dart';
import 'package:login_flutter/app/login/login_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final loginController = LoginController();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginForm(),
    );
  }

  Widget loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              usernameField(),
              SizedBox(height: 15),
              passwordField(),
              SizedBox(height: 15),
              loginButtom(),
              Observer(builder: (_) {
                return Text(
                    "${loginController.login.username} ${loginController.login.password}");
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return Observer(builder: (_) {
      return TextFormField(
        // controller: _usernameController,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.black45,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.cyanAccent,
              width: 2,
            ),
          ),
          labelText: 'Usuário',
        ),
        validator: (value) {
          null;
        },
        onChanged: loginController.login.setUsername,
      );
    });
  }

  Widget passwordField() {
    return Observer(builder: (_) {
      return TextFormField(
        // controller: _passwordController,
        obscureText: !loginController.showPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.security),
          suffixIcon: IconButton(
            icon: loginController.showPassword
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            tooltip: 'Visualizar Senha',
            onPressed: () {
              loginController.toggleShowPassword();
            },
          ),
          counter: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.black45,
              textStyle: const TextStyle(fontSize: 16),
            ),
            onPressed: () {},
            child: const Text('Esqueci a senha!'),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          labelText: 'Senha',
        ),
        validator: (value) {
          null;
        },
        onChanged: loginController.login.setPassword,
      );
    });
  }

  Widget loginButtom() {
    return ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(child: Text('Entrar')),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
