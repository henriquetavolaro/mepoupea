import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoogleSignInEvent extends AuthenticationEvent {}

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

class FacebookSignInEvent extends AuthenticationEvent {}

class AuthenticationLoggedOut extends AuthenticationEvent {}