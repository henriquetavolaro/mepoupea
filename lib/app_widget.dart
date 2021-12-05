import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/pages/logged_page.dart';
import 'package:mepoupeapp/presenter/pages/login/login_1.dart';
import 'package:mepoupeapp/presenter/pages/login/login_phone.dart';
import 'package:mepoupeapp/presenter/pages/my_home_page.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_1.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_2.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_3_ganhar_mais.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_3_investir_melhor.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_3_quitar_dividas.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_3_gastar_menos.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_3_nao_sei.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_4hoje_nao.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/onboarding_5.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/prefiro_app_pior.dart';
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
        initialRoute: '/login_phone',
        routes: {
          '/onboarding_1': (context) => const OnboardingScreen1(),
          '/onboarding_2': (context) => const OnboardingScreen2(),
          '/onboarding_3_ganhar_mais': (context) => const Onboarding3GanharMais(),
          '/onboarding_3_investir_melhor': (context) => const Onboarding3InvestirMelhor(),
          '/onboarding_3_quitar_dividas': (context) => const Onboarding3QuitarDividas(),
          '/onboarding_3_gastar_menos': (context) => const Onboarding3GastarMenos(),
          '/onboarding_3_naosei': (context) => const Onboarding3NaoSei(),
          '/onboarding_4_hojenao': (context) => const Onboarding4HojeNao(),
          '/onboarding_5': (context) => const Onboarding5(),
          '/prefiro_app_pior': (context) => const PrefiroAppPior(),

          '/login_1': (context) => const Login1(),
          '/login_phone': (context) => const LoginPhone(),



          '/home_page': (context) => const MyHomePage(),
          '/logged': (context) => const Logged()
        });
  }
}
