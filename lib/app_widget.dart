import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/pages/logged_page.dart';
import 'package:mepoupeapp/presenter/pages/my_home_page.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_1.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_2.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_3a.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_3b.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_3c.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_3d.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_3e_nao_sei.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_4hoje_nao.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_5.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
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
    // sl.get<AuthenticationBloc>().add(AuthenticationListenUserChangeEvent(navigatorKey));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Me Poupe! App",
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/onboarding_5',
        routes: {
          '/onboarding_1': (context) => const OnboardingScreen1(),
          '/onboarding_2': (context) => const OnboardingScreen2(),
          '/onboarding_3a': (context) => const Onboarding3A(),
          '/onboarding_3b': (context) => const Onboarding3B(),
          '/onboarding_3c': (context) => const Onboarding3C(),
          '/onboarding_3d': (context) => const Onboarding3D(),
          '/onboarding_3e_naosei': (context) => const Onboarding3ENaoSei(),
          '/onboarding_4_hojenao': (context) => const Onboarding4HojeNao(),
          '/onboarding_5': (context) => const Onboarding5(),
          '/home_page': (context) => const MyHomePage(),
          '/logged': (context) => const Logged()
        });
  }
}
