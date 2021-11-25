import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/bloc/user/get_user_profile/bloc_get_user_profile.dart';
import 'package:mepoupeapp/presenter/bloc/user/get_user_profile/state_get_user_profile.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GetUserProfileBloc bloc;

  @override
  void initState() {
    bloc = sl.get<GetUserProfileBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bloc.add(GetUserProfileEvent());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var phoneNumberController = TextEditingController();
  var smsCodeController = TextEditingController();
  var phoneMask = MaskTextInputFormatter(
      mask: '(__) _________', filter: {'_': RegExp(r'[0-9]')});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetUserProfileBloc, GetUserProfileState>(
            bloc: sl.get<GetUserProfileBloc>(),
            builder: (context, state) {
              if (state is GetUserProfileInitialState) {
                return const Center(child: Text("initial"));
              } else if (state is GetUserProfileLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetUserProfileSuccessState) {
                return Center(child: Text(state.userProfile.email.toString()));
              } else if (state is GetUserProfileErrorState) {
                return const Center(
                  child: Text("sssssss"),
                );
              } else {
                return const Center(
                  child: Text("erro"),
                );
              }
            }),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
              onPressed: () {
                sl.get<AuthenticationBloc>().add(GoogleSignInEvent());
              },
              icon: const FaIcon(FontAwesomeIcons.google),
              label: const Text('Sign Up with Google')),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
              onPressed: () {
                sl.get<AuthenticationBloc>().add(FacebookSignInEvent());
              },
              icon: const FaIcon(FontAwesomeIcons.facebook),
              label: const Text('Sign Up with Facebook')),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            inputFormatters: [phoneMask],
            controller: phoneNumberController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Telefone",
                hintText: "Insira o número do telefone"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: smsCodeController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Código de validação",
                hintText: "Insira o código"),
          ),
        ),
        TextButton(
            onPressed: () {
              sl.get<AuthenticationBloc>().add(PhoneSignInSendCodeEvent(
                  phoneNumberController.text.toString()));
            },
            child: Text('fetch OTP')),
        TextButton(
            onPressed: () {
              sl.get<AuthenticationBloc>().add(
                  PhoneSignInVerifyEvent(smsCodeController.text.toString()));
            },
            child: Text('Send'))
      ],
    );
  }
}
