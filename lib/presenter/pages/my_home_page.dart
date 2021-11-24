
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/bloc/user/get_user_profile/bloc_get_user_profile.dart';
import 'package:mepoupeapp/presenter/bloc/user/get_user_profile/state_get_user_profile.dart';

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
      appBar: AppBar(title: Text("App"),
      ),
      body: MyBloc(),
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

class MyBloc extends StatefulWidget {

  const MyBloc({Key? key}) : super(key: key);

  @override
  _MyBlocState createState() => _MyBlocState();
}

class _MyBlocState extends State<MyBloc> {

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
              } else if (state is GetUserProfileErrorState){
                return const Center(child: Text("sssssss"),);
              } else {
                return const Center(child: Text("erro"),);
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
      ],
    );
  }
}

