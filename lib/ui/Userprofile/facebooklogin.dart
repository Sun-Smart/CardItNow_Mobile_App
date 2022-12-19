import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLogin extends StatefulWidget {
  const FacebookLogin({super.key});

  @override
  State<FacebookLogin> createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLogin> {
  String user_mail='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("usermail:",style: TextStyle(fontSize: 14,color: Colors.black),),
               Text(user_mail),
            ],
          ),
          ElevatedButton(onPressed: (){
signInWithFacebook();
setState(() {
  
});
          }, child: Text("Login"))
        ],
      ),
    );

  }


Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login(
    permissions: ['email','public_profile']
  );

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
  final userData=await FacebookAuth.instance.getUserData();
  user_mail=userData['email'];
  

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  
}
}
