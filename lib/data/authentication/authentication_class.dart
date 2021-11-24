import 'package:firebase_auth/firebase_auth.dart';
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

    print("token: ${credential.idToken}");
    // Once signed in, return the UserCredential
    final userCredential = await auth.signInWithCredential(credential);

    return credential;

  }

  Future<bool> isSignedIn() async {
    final currentUser = auth.currentUser;
    return currentUser != null;
  }

  Future<User?> getUser() async {
    return auth.currentUser;
  }

}

