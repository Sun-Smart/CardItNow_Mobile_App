import 'package:cardit/services/gmail_auth_services.dart';
import 'package:cardit/ui/4digit-passcode.dart';
import 'package:cardit/ui/dashboard/dashbordscreen.dart';
import 'package:cardit/ui/dashboard/loans-payment.dart';
import 'package:cardit/ui/dashboard/loans.dart';
import 'package:cardit/ui/login.dart';
import 'package:cardit/ui/manage_cards/add_card.dart';
import 'package:cardit/ui/manage_cards/manula_card.dart';
import 'package:cardit/ui/manage_cards/scan_card.dart';
import 'package:cardit/ui/register-loading.dart';
import 'package:cardit/ui/register.dart';
import 'package:cardit/ui/select_country.dart';
import 'package:cardit/ui/update-password-code.dart';
import 'package:cardit/ui/update-password.dart';
import 'package:cardit/ui/user_details/userdetails.dart';
import 'package:cardit/ui/verify-email.dart';
import 'package:cardit/ui/verify-userid.dart';
import 'package:flutter/material.dart';

import 'ui/Userprofile/profile.dart';
import 'ui/Userprofile/settings.dart';
import 'ui/dashboard/onboard-seller-apply.dart';
import 'ui/dashboard/onboard-seller-load.dart';
import 'ui/dashboard/onboard-seller.dart';
import 'ui/dashboard/payments.dart';
import 'ui/dashboard/paymentsdetails.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => AuthService().handleAuthState());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/selectcountry':
        return MaterialPageRoute(builder: (_) => const Selectcountry());
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
      case '/settings':
        return MaterialPageRoute(builder: (_) => const Settings());
      case '/addCard':
        return MaterialPageRoute(builder: (_) => const AddCard());
      case '/scanCard':
        return MaterialPageRoute(builder: (_) => const ScanCard());
      case '/manualCard':
        return MaterialPageRoute(builder: (_) => const ManualCard());

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
