import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/pages/logged_page.dart';
import 'package:mepoupeapp/presenter/pages/my_home_page.dart';
import 'package:mepoupeapp/utils/secure_storage.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    sl.get<AuthenticationBloc>().add(AuthenticationLoggedOutEvent());
    super.initState();
    sl.get<AuthenticationBloc>().add(AuthenticationListenUserChangeEvent(navigatorKey));
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
