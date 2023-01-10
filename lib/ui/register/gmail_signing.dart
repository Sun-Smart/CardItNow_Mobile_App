// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gmail_controller.dart';

class GoogleSigningPage extends StatefulWidget {
  const GoogleSigningPage({Key? key}) : super(key: key);

  @override
  State<GoogleSigningPage> createState() => _GoogleSigningPageState();
}

class _GoogleSigningPageState extends State<GoogleSigningPage> {
  final controller = Get.put(GmailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Gmail Login'),
          foregroundColor: Colors.black,
          centerTitle: true),
      body: Center(
        child: Obx(() {
          if (controller.googleAccount.value == null)
            return buildLogin();
          else
            return buildProfileView();
        }),
      ),
    );
  }

  FloatingActionButton buildLogin() {
    return FloatingActionButton.extended(
        onPressed: () {
          // controller.login();

          controller.signinWithGoogle();
        },
        icon: Icon(Icons.gps_off_outlined, color: Colors.black),
        label: Text('Google Signing'));
  }

  Column buildProfileView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
            backgroundImage: Image.network(
                    controller.googleAccount.value?.photoUrl ?? '',
                    color: Colors.amberAccent)
                .image,
            radius: 100),
        SizedBox(height: 20),
        Text(controller.googleAccount.value?.displayName ?? '',
            style: Get.textTheme.headline6),
        SizedBox(height: 20),
        Text(controller.googleAccount.value?.email ?? '',
            style: Get.textTheme.headline6),
        SizedBox(height: 50),
        ActionChip(
          label: Text('Logout'),
          avatar: Icon(Icons.logout_outlined),
          onPressed: () {
            controller.logout();
          },
        )
      ],
    );
  }
}
