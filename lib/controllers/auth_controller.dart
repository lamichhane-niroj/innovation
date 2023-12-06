import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  static final fauth = FirebaseAuth.instance;
  static final faceauth = FacebookAuth.instance;
  static final gauth = GoogleSignIn();

  // signup user
  Future<bool> signupUser(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await fauth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        return true;
      }
      return false;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }

  // login user
  Future<bool> loginUser(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await fauth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        return true;
      }
      return false;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }

  // signup with google
  Future<bool> googleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await gauth.signIn();

      if (googleSignInAccount != null) {
        // you are logged through google
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential userCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        // sign in to firebase
        await fauth.signInWithCredential(userCredential);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }

  // signup with facebook
  Future<bool> facebookSignIn(BuildContext context) async {
    try {
      final LoginResult result = await faceauth.login();

      if (result.status == LoginStatus.success) {
        // you are logged through facebook
        final AccessToken accessToken = result.accessToken!;

        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        await fauth.signInWithCredential(credential);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }
}
