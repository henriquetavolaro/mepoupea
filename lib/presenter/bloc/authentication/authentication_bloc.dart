import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/data/authentication/authentication_class.dart';

import '../auth_events.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationClass authentication;

  AuthenticationBloc(this.authentication): super(AuthenticationInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is GoogleSignInEvent) {
      try {
        final credential = await authentication.signInWithGoogle();
        print('my credential: ${credential.idToken}');
        yield AuthenticationSuccessState(credential);
      } catch(e) {
        yield AuthenticationFailureState(e.toString());
      }
    }
    if(event is FacebookSignInEvent){
      try{
        authentication.facebookSignIn();
      } catch (e){
        yield AuthenticationFailureState(e.toString());
      }
    }
    if(event is PhoneSignInSendCodeEvent){
      try {
        authentication.sendSmsCode(event.phoneNumber);
      } catch(e) {
        print(e.toString());
      }
    }
    if(event is PhoneSignInVerifyEvent){
      try {
        final verify = await authentication.verifySmsCode(event.smsCode);
        print('VERIFY: $verify');
        yield AuthenticationPhoneSuccessState(verify);
      } catch(e) {
        yield AuthenticationFailureState(e.toString());
      }
    }
    if(event is RegisterWithEmailAndPasswordEvent){
      try {
        await authentication.registerWithEmailAndPassword(event.email, event.password);
      } catch(e) {
        yield RegisterEmailAndPasswordFailureState(e.toString());
      }
    }
    if(event is SignInWithEmailAndPasswordEvent){
      try {
        await authentication.signInWithEmailAndPassword(event.email, event.password);
      } catch(e) {
        yield SignInEmailAndPasswordFailureState(e.toString());
      }
    }
    if(event is AuthenticationLoggedOutEvent){
      authentication.signOut();
    }
    if(event is AuthenticationListenUserChangeEvent){
      authentication.listenUserChanges(event.navigatorKey);
    }
    if(event is AuthenticationGetTokenEvent){
      final result = await authentication.getUserId();
      yield AuthenticationTokenState(result);
    }

  }
}
