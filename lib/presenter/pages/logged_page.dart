import 'package:flutter/material.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/bloc/user/get_user_profile/bloc_get_user_profile.dart';
import 'package:mepoupeapp/utils/secure_storage.dart';

class Logged extends StatefulWidget {
  const Logged({Key? key}) : super(key: key);

  @override
  _LoggedState createState() => _LoggedState();
}

class _LoggedState extends State<Logged> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              sl.get<AuthenticationBloc>().add(AuthenticationLoggedOutEvent());
            },
            child: Text("logout")),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            sl.get<GetUserProfileBloc>().add(GetUserProfileEvent());
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),     );
  }
}
