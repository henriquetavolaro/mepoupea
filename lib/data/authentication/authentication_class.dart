import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mepoupeapp/utils/secure_storage.dart';

class AuthenticationClass {
  final FirebaseAuth auth;
  final SecureStorage storage;

  AuthenticationClass(this.auth, this.storage);

  Future<OAuthCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await auth.signInWithCredential(credential);

    return credential;
  }

  String verificationId = '';

  Future<void> fetchOtp(String phoneNumber) async {
    await auth.verifyPhoneNumber(
        phoneNumber: "+55$phoneNumber",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('Invalid phone number');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<void> verify(String smsCode) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await auth.signInWithCredential(phoneAuthCredential);
  }

  void facebookSignIn() async {
    try {
      final result = await FacebookAuth.instance.login();
      final facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  Future<StreamSubscription<User?>> listenUserChanges(
      GlobalKey<NavigatorState> navigatorKey) async {
    final sub = auth.userChanges().listen((event) async {
      if (event != null) {
        final token = await getUserId();
        await storage.setToken(token);
        navigatorKey.currentState!.pushReplacementNamed('/logged');
      } else {
        await storage.removeToken();
        navigatorKey.currentState!.pushReplacementNamed('/home_page');
      }
    });
    return sub;
  }

  Future<String> getUserId() async {
    var userid = await auth.currentUser!.getIdToken(true);
    return userid;
  }

  Future<void> signOut() async {
    await storage.removeToken();
    return await auth.signOut();
  }
}
