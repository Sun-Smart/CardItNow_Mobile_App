// ignore_for_file: unnecessary_new, avoid_print

import 'dart:async';
import 'dart:io';
import 'package:cardit/firebase_options.dart';
import 'package:cardit/themes/Themes.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/splash/splash_screen.dart';
import 'package:cardit/ui/splash/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'api/regster_api.dart';
import 'base_client.dart';

DarkThemeProvider themeChangeProvider = DarkThemeProvider();

Size size = WidgetsBinding.instance.window.physicalSize /
    WidgetsBinding.instance.window.devicePixelRatio;


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future main() async {
  HttpOverrides.global = MyHttpOverrides();
  if(!kIsWeb){
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  }else{
    WidgetsFlutterBinding.ensureInitialized(

    );
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
      // initialiaze the facebook javascript SDK
    await FacebookAuth.instance.webAndDesktopInitialize(
      appId: "601591934671361",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  await GetStorage.init();

  runApp(const MyApp());
  Get.put(RegisterAPI());
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

  //TIMER OUT
  void _initializeTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(const  Duration(minutes: 5), _logOutUser);
  }

  void _logOutUser() {
    if(GetStorage().read("save_token").toString() != 'null'){
      _timer?.cancel();
      _timer = null;
      print("Time OUT");
      DialogHelper.showContinueDialog();
    }
  }

  void _handleUserInteraction([_]) {
    _initializeTimer();
  }

  // GET THEME
  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  //FIND COOKIES
  void findCookies(){
    // if(kIsWeb){
    //   try {
    //     var jsWindow = html.window.navigator.cookieEnabled;
    //     print(jsWindow);
    //     if(jsWindow ?? false) {
    //       print("cookies enabled");
    //     }
    //   } catch (err) {
    //     print("cookies disabled");
    //   }
    // }
  }

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
                title: 'Card-it',
                debugShowCheckedModeBanner: false,
                theme: Styles.themeData(themeChangeProvider.darkTheme, context),
               home: kIsWeb ? Home() : SplashScreens()),
          );
        },
      ),
    );
  }
}


