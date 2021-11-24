
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