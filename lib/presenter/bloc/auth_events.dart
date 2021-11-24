import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoogleSignInEvent extends AuthenticationEvent {}

class PhoneSignInEvent extends AuthenticationEvent {}

class FacebookSignInEvent extends AuthenticationEvent {}



class AuthenticationLoggedOut extends AuthenticationEvent {}