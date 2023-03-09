// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../api/regster_api.dart';

class AuthService {
  final RegisterAPI con = Get.find();

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
        "mediatype": "Google",
        "mobile":details.user!.phoneNumber.toString(),
        "geoid": RegisterAPI.dropdownvalue["geoid"].toString()
      };
      con.registerSignAPI(userDatas);
      GetStorage().write('useremail', details.user!.email);
      GetStorage().write('avatarpic', details.user!.photoURL);
    }

  }

  // 3. Sign Out()
  signOut() async {
    FirebaseAuth.instance.signOut();
  }
}
