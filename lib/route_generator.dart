
import 'package:cardit_app/ui/4digit-passcode.dart';
import 'package:cardit_app/ui/dashboard/dashbordscreen.dart';
import 'package:cardit_app/ui/dashboard/loans-payment.dart';
import 'package:cardit_app/ui/dashboard/loans.dart';
import 'package:cardit_app/ui/dashboard/onboard_recipient.dart';
import 'package:cardit_app/ui/dashboard/select_documents.dart';
import 'package:cardit_app/ui/dashboard/select_recipient.dart';
import 'package:cardit_app/ui/register-loading.dart';
import 'package:cardit_app/ui/register.dart';
import 'package:cardit_app/ui/splashscreen.dart';
import 'package:cardit_app/ui/update-password-code.dart';
import 'package:cardit_app/ui/update-password.dart';
import 'package:cardit_app/ui/verify-email.dart';
import 'package:cardit_app/ui/verify-userid.dart';
import 'package:flutter/material.dart';

import 'ui/Userprofile/profile.dart';
import 'ui/Userprofile/userdetails.dart';
import 'ui/dashboard/onboard-seller-apply.dart';
import 'ui/dashboard/onboard-seller-load.dart';
import 'ui/dashboard/onboard-seller.dart';
import 'ui/dashboard/payments.dart';
import 'ui/dashboard/paymentsdetails.dart';
import 'ui/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreens());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/4digitpasscode':
        return MaterialPageRoute(builder: (_) => const Passcode());
      case '/verifyemail':
        return MaterialPageRoute(builder: (_) => const VerifyEmail());
      case '/updatepasswordcode':
        return MaterialPageRoute(builder: (_) => const UpdatePasswordCode());
      case '/updatepassword':
        return MaterialPageRoute(builder: (_) => const UpdatePassword());
      case '/verifyuserid':
        return MaterialPageRoute(builder: (_) => const VerifyUserId());
      case '/dashbordScreen':
        return MaterialPageRoute(builder: (_) => const DashbordScreen());
      case '/registerloading':
        return MaterialPageRoute(builder: (_) => const Registerloading());
      case '/loan':
        return MaterialPageRoute(builder: (_) => const Loans());
      case '/loanpayment':
        return MaterialPageRoute(builder: (_) => const LoansPayment());
      case '/onboardseller':
        return MaterialPageRoute(builder: (_) => const OnboardSeller());
      case '/onboardsellerlode':
        return MaterialPageRoute(builder: (_) => const OnboardSellerLoad());
      case '/onboardsellerapply':
        return MaterialPageRoute(builder: (_) => const OnboardSellerApply());
      case '/payments':
        return MaterialPageRoute(builder: (_) => const Payments());
      case '/paymentsdetails':
        return MaterialPageRoute(builder: (_) => const PaymentsDetails());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const Profile());
      case '/userdetails':
        return MaterialPageRoute(builder: (_) => const UserDetails());
      case '/selecttypeofrecipient':
      return MaterialPageRoute(builder: (_) => const RecipientType());
       case '/selectdocuments':
      return MaterialPageRoute(builder: (_) => const SelectDocuments());
       case '/onboardrecipient':
      return MaterialPageRoute(builder: (_) => const onboardRecipient());


      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Page not Found'),
        ),
      );
    });
  }
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, Object? arg) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arg);
  }
}
