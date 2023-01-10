// ignore_for_file: prefer_final_fields, unnecessary_import
import 'package:cardit/ui/landingscreens/dashbord_screen.dart';
import 'package:cardit/ui/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GmailController extends GetxController {
  var _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  // login() async {
  //   googleAccount.value = await _googleSignin.signIn();
  // }

  //1. Handle Auth State()
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const DashbordScreen();
        } else {
          return const SplashScreens();
        }
      },
    );
  }

  //2. SignIn With Google account()
  signinWithGoogle() async {
    // Trigger the auth flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    //Obtain the auth details
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //Create a new Credential
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  logout() async {
    // googleAccount.value = await _googleSignin.signOut();
    FirebaseAuth.instance.signOut();
  }
}
