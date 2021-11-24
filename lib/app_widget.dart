import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/pages/logged_page.dart';
import 'package:mepoupeapp/presenter/pages/my_home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

  late StreamSubscription<User?> sub;
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    sub = FirebaseAuth.instance.userChanges().listen((event) {
      navigatorKey.currentState!.pushReplacementNamed(
        event != null ? '/logged' : '/home_page',
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Me Poupe! App",
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home_page',
      routes: {
          '/home_page': (context) => const MyHomePage(),
          '/logged': (context) => const Logged()
        });
  }
}
