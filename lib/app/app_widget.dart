import 'package:flutter/material.dart';
import 'package:login_flutter/app/home/home_view.dart';
import 'package:login_flutter/app/login/login_controller.dart';
import 'package:login_flutter/app/login/login_view.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginController>(
          create: (context) => LoginController(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginView(),
        routes: <String, WidgetBuilder>{
          '/home-page': (BuildContext context) => new HomeView(),
        },
      ),
    );
  }
}
