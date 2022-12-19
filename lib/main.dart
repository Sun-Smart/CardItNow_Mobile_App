

import 'package:cardit_app/route_generator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'services/appglobal.dart';

Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: AppGlobal().brightness,
          fontFamily: 'Sora',
          primaryColor: Colors.white,
          scaffoldBackgroundColor: const Color(0xFFffffff),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Color(0xFFffffff),
          )),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
