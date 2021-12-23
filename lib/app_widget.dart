import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/pages/login/login_1.dart';
import 'package:mepoupeapp/presenter/pages/login/login_email.dart';
import 'package:mepoupeapp/presenter/pages/login/login_phone.dart';
import 'package:mepoupeapp/presenter/pages/login/login_phone_verification.dart';
import 'package:mepoupeapp/presenter/pages/onboarding/loading.dart';
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
import 'package:mepoupeapp/presenter/pages/pos_selfie/criar_meta_1.dart';
import 'package:mepoupeapp/presenter/pages/pos_selfie/criar_meta_2.dart';
import 'package:mepoupeapp/presenter/pages/pos_selfie/criar_meta_3.dart';
import 'package:mepoupeapp/presenter/pages/pos_selfie/criar_meta_4.dart';
import 'package:mepoupeapp/presenter/pages/pos_selfie/gastos_detalhes_1.dart';
import 'package:mepoupeapp/presenter/pages/pos_selfie/home_pos_selfie.dart';
import 'package:mepoupeapp/presenter/pages/pos_selfie/minhas_metas.dart';
import 'package:mepoupeapp/presenter/pages/pre_selfie/atualizando_selfie.dart';
import 'package:mepoupeapp/presenter/pages/pre_selfie/como_prefere_conectar.dart';
import 'package:mepoupeapp/presenter/pages/pre_selfie/conta_manual.dart';
import 'package:mepoupeapp/presenter/pages/pre_selfie/escolha_dos_bancos.dart';
import 'package:mepoupeapp/presenter/pages/pre_selfie/pre_selfie_1.dart';
import 'package:mepoupeapp/presenter/pages/pre_selfie/pre_selfie_exemplo_1.dart';
import 'package:mepoupeapp/presenter/pages/pre_selfie/pre_selfie_exemplo_2.dart';
import 'package:mepoupeapp/presenter/pages/pre_selfie/pre_selfie_exemplo_3.dart';
import 'package:mepoupeapp/presenter/pages/pre_selfie/pre_selfie_nome.dart';
import 'package:mepoupeapp/presenter/pages/pre_selfie/termos.dart';
import 'package:mepoupeapp/presenter/pages/selfie_financeira/camera.dart';
import 'package:mepoupeapp/presenter/pages/selfie_financeira/mostrar_selfie.dart';
import 'package:mepoupeapp/presenter/pages/selfie_financeira/selfie_financeira_1.dart';
import 'package:mepoupeapp/presenter/pages/selfie_financeira/selfie_financeira_2.dart';
import 'package:mepoupeapp/presenter/pages/selfie_financeira/tirar_selfie.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    sl
        .get<AuthenticationBloc>()
        .add(AuthenticationListenUserChangeEvent(navigatorKey));
  }

  @override
  Widget build(BuildContext context) {
    return AppLifeCycleManager(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Me Poupe! App",
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/minhas_metas',
        routes: {
          '/onboarding_1': (context) => const OnboardingScreen1(),
          '/onboarding_2': (context) => const OnboardingScreen2(),
          '/onboarding_3_ganhar_mais': (context) =>
              const Onboarding3GanharMais(),
          '/onboarding_3_investir_melhor': (context) =>
              const Onboarding3InvestirMelhor(),
          '/onboarding_3_quitar_dividas': (context) =>
              const Onboarding3QuitarDividas(),
          '/onboarding_3_gastar_menos': (context) =>
              const Onboarding3GastarMenos(),
          '/onboarding_3_naosei': (context) => const Onboarding3NaoSei(),
          '/onboarding_4_hojenao': (context) => const Onboarding4HojeNao(),
          '/onboarding_5': (context) => const Onboarding5(),
          '/prefiro_app_pior': (context) => const PrefiroAppPior(),
          '/login_1': (context) => const Login1(),
          '/login_email': (context) => const LoginEmail(),
          '/login_phone': (context) => const LoginPhone(),
          '/login_phone_verification': (context) => LoginPhoneVerification(
                phoneNumber:
                    ModalRoute.of(context)!.settings.arguments as String,
              ),
          '/loading': (context) => const Loading(),
          '/pre_selfie_nome': (context) => const PreSelfieNome(),
          '/pre_selfie_1': (context) => const PreSelfie1(),
          '/pre_selfie_exemplo_1': (context) => const PreSelfieExemplo1(),
          '/pre_selfie_exemplo_2': (context) => const PreSelfieExemplo2(),
          '/pre_selfie_exemplo_3': (context) => const PreSelfieExemplo3(),
          '/como_prefere_conectar': (context) => const ComoPrefereConectar(),
          '/conta_manual': (context) => const ContaManual(),
          '/escolha_dos_bancos': (context) => const EscolhaDosBancos(),
          '/termos': (context) => const Termos(),
          '/atualizando_selfie': (context) => const AtualizandoSelfie(),
          '/selfie_financeira_1': (context) => SelfieFinanceira1(
            imageFile: ModalRoute.of(context)!.settings.arguments as XFile?,
          ),
          '/selfie_financeira_2': (context) => SelfieFinanceira2(),
          '/tirar_selfie': (context) => const TirarSelfie(),
          '/camera': (context) => Camera(
                cameras: ModalRoute.of(context)!.settings.arguments
                    as List<CameraDescription>,
              ),
          '/mostrar_selfie': (context) => MostrarSelfie(
              imageFile: ModalRoute.of(context)!.settings.arguments as XFile),
          '/home_pos_selfie': (context) => const HomePosSelfie(),
          '/criar_meta_1': (context) => const CriarMeta1(),
          '/criar_meta_2': (context) => const CriarMeta2(),
          '/criar_meta_3': (context) => const CriarMeta3(),
          '/criar_meta_4': (context) => const CriarMeta4(),
          '/minhas_metas': (context) => const MinhasMetas(),
          '/gastos_detalhes_1': (context) => const GastosDetalhes1(),

        },
      ),
    );
  }
}

class AppLifeCycleManager extends StatefulWidget {
  final Widget child;

  const AppLifeCycleManager({Key? key, required this.child}) : super(key: key);

  @override
  _AppLifeCycleManagerState createState() => _AppLifeCycleManagerState();
}

class _AppLifeCycleManagerState extends State<AppLifeCycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.paused:
        print('ON PAUSED');
        break;
      case AppLifecycleState.resumed:
        print('ON RESUMED');
        break;
      case AppLifecycleState.inactive:
        print('ON INACTIVE');
        sl.get<AuthenticationBloc>().add(AuthenticationLoggedOutEvent());
        break;
      case AppLifecycleState.detached:
        print('ON DETACHED');
        sl.get<AuthenticationBloc>().add(AuthenticationLoggedOutEvent());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    print('ON DISPOSE');
    sl.get<AuthenticationBloc>().add(AuthenticationLoggedOutEvent());
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}
