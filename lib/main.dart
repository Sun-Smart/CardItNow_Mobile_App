import 'package:cardit/route_generator.dart';
import 'package:cardit/services/gmail_auth_services.dart';
import 'package:cardit/themes/Themes.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: 'Flutter Cardit',
            debugShowCheckedModeBanner: false,
            //theme: themeProvider.getTheme,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            initialRoute: "/",
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
