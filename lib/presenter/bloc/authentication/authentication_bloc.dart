import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/data/authentication/authentication_class.dart';

import '../auth_events.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationClass _userRepository;

  AuthenticationBloc({required AuthenticationClass userRepository})
      : _userRepository = userRepository,
        super(AuthenticationInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is GoogleSignInEvent) {
      try {
        final credential = await _userRepository.signInWithGoogle();
        print('my credential: ${credential.idToken}');
        final isSignedIn = await _userRepository.isSignedIn();
        print('is signed in: $isSignedIn');
        yield AuthenticationSuccessState(credential);
      } catch(e) {
        yield AuthenticationFailureState(e.toString());
      }

      // final isSignedIn = await _userRepository.isSignedIn();
      // if (isSignedIn) {
      //   final firebaseUser = await _userRepository.getUser();
      //   yield AuthenticationSuccess(firebaseUser!);
    }
    //   else {
    //     yield AuthenticationFailure();
    //   }
    // } else if (event is AuthenticationLoggedIn) {
    //   final result = await _userRepository.getUser();
    //   yield AuthenticationSuccess(result!);
    // } else if (event is AuthenticationLoggedOut) {
    //   yield AuthenticationFailure();
  }
}
