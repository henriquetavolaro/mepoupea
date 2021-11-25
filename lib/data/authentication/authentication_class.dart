import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationClass {

  final FirebaseAuth auth;

  AuthenticationClass(this.auth);


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
        verificationFailed: (FirebaseAuthException e){
          if(e.code == 'invalid-phone-number'){
            print('Invalid phone number');
          }
        },
        codeSent: (String verificationId, int? resendToken) async{
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId){});
  }

  Future<void> verify(String smsCode) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    print('auth provider: ${phoneAuthCredential.providerId}');
    print('auth token: ${phoneAuthCredential.token}');
    await auth.signInWithCredential(phoneAuthCredential);
  }

  void facebookSignIn() async {
    try {
      final result = await FacebookAuth.instance.login();

      print('facebook token: ${result.accessToken!.token}');

      final facebookAuthCredential =
      FacebookAuthProvider.credential(result.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }


  Future<bool> isSignedIn() async {
    final currentUser = auth.currentUser;
    return currentUser != null;
  }

  Future<User?> getUser() async {
    return auth.currentUser;
  }

  Future<void> signOut() async {
    return await auth.signOut();
  }

}

