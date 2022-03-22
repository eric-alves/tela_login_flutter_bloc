import 'package:flutter/material.dart';
import 'package:login_flutter/app/login/login_controller.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);

    return Container(
      child: Text("${loginController.login.username}"),
    );
  }
}
