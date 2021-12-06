
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {
  final OAuthCredential credential;

  const AuthenticationSuccessState(this.credential);

  @override
  List<Object> get props => [credential];
}

class AuthenticationFailureState extends AuthenticationState {

  final String message;

  const AuthenticationFailureState(this.message);

  @override
  List<Object> get props => [message];
}

class AuthenticationTokenState extends AuthenticationState {

  final String token;

  const AuthenticationTokenState(this.token);

  @override
  List<Object> get props => [token];
}

class AuthenticationPhoneSuccessState extends AuthenticationState {

  final PhoneAuthCredential phoneAuthCredential;

  const AuthenticationPhoneSuccessState(this.phoneAuthCredential);

  @override
  List<Object> get props => [phoneAuthCredential];

}

class RegisterEmailAndPasswordFailureState extends AuthenticationState {

  final String message;

  const RegisterEmailAndPasswordFailureState(this.message);

  @override
  List<Object> get props => [message];

}

class SignInEmailAndPasswordFailureState extends AuthenticationState {

  final String message;

  const SignInEmailAndPasswordFailureState(this.message);

  @override
  List<Object> get props => [message];

}