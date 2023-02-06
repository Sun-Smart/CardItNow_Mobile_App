// ignore_for_file: unnecessary_new, avoid_print

import 'dart:async';
import 'dart:html';
import 'dart:io';
import 'dart:html' as html;
import 'package:cardit/route_generator.dart';
import 'package:cardit/themes/Themes.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'auth/auth.dart';
import 'base_client.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
Size size = WidgetsBinding.instance.window.physicalSize /
    WidgetsBinding.instance.window.devicePixelRatio;

Future main() async {
  if(!kIsWeb){
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  }
  await GetStorage.init();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
  Get.put(AuthCon());
  // Get.put(loginauth());
  // Get.put(cardsapi());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static var logindetails;
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    _initializeTimer();
    findCookies();
  }

  void _initializeTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(const Duration(minutes: 5), _logOutUser);
  }

  void _logOutUser() {
    if(GetStorage().read("save_token").toString() != 'null'){
      _timer?.cancel();
      _timer = null;
      print("Time OUT");
      DialogHelper.showContinueDialog();
    }
  // Popping all routes and pushing welcome screen
   // _navigatorKey.currentState?.pushNamedAndRemoveUntil('welcome', (_) => false);
  }

  void _handleUserInteraction([_]) {
    _initializeTimer();
  }


  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  void findCookies(){
   
    if(kIsWeb){
      try {
       
        var jsWindow = html.window.navigator.cookieEnabled;
        print(jsWindow);
        if(jsWindow ?? false) {
          print("cookies enabled");
        } else{
          print("cookies disabled");
        }
      } catch (err) {
        print("cookies disabled");
      }
      
    }
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
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _handleUserInteraction,
            onPanDown: _handleUserInteraction,
            child: GetMaterialApp(
                navigatorKey: navigatorKey,
                title: 'Card-it',
                debugShowCheckedModeBanner: false,
                //theme: themeProvider.getTheme,
                theme: Styles.themeData(themeChangeProvider.darkTheme, context),
                initialRoute: "/",
                onGenerateRoute: RouteGenerator.generateRoute),
          );
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
