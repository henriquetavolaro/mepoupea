import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoogleSignInEvent extends AuthenticationEvent {}

class FacebookSignInEvent extends AuthenticationEvent {}

class PhoneSignInSendCodeEvent extends AuthenticationEvent {

  final String phoneNumber;


  PhoneSignInSendCodeEvent(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];

}

class PhoneSignInVerifyEvent extends AuthenticationEvent {
  final String smsCode;

  PhoneSignInVerifyEvent(this.smsCode);

  @override
  List<Object> get props => [smsCode];
}

class AuthenticationLoggedOutEvent extends AuthenticationEvent {}

class AuthenticationGetTokenEvent extends AuthenticationEvent {}

class AuthenticationListenUserChangeEvent extends AuthenticationEvent {

  final GlobalKey<NavigatorState> navigatorKey;

  AuthenticationListenUserChangeEvent(this.navigatorKey);

  @override
  List<Object> get props => [navigatorKey];

}