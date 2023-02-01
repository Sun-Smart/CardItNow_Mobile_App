// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

import 'package:cardit/auth/auth.dart';
import 'package:cardit/ui/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final AuthCon con = Get.find();

  //1. Handle Auth State()
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        return SplashScreens();
      },
    );
  }

  //2. SignIn With Google account()
  signinWithGoogle() async {
    FirebaseAuth.instance.signOut();

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
    var details = await FirebaseAuth.instance.signInWithCredential(credential);

    if(details.user!.emailVerified){
      con.emailController.text = details.user!.email!;
      var userDatas = {
        "email": details.user!.email.toString(),
        "firstname": details.user!.displayName.toString(),
        "lastname": "",
        "socialid": details.user!.uid.toString(),
        "mediatype": "Google"
      };
      con.registerSignAPI(userDatas);
     GetStorage().write('username', details.user!.displayName);
      GetStorage().write('useremail', details.user!.email);
      GetStorage().write('avatarpic', details.user!.photoURL);
    }

  }

  // 3. Sign Out()
  signOut() async {
    FirebaseAuth.instance.signOut();
  }
}
