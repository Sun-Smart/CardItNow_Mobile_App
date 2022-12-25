import 'package:cardit/services/gmail_auth_services.dart';
import 'package:cardit/ui/4digit_psw_screen/4digit_passcode_screen.dart';
import 'package:cardit/ui/dashboard_screen/dashbord_screen.dart';
import 'package:cardit/ui/loan_screen/loans-payment_screen.dart';
import 'package:cardit/ui/loan_screen/loans_screen.dart';
import 'package:cardit/ui/onboard_screen/onboard-seller-load_screen.dart';
import 'package:cardit/ui/register_loading_screen/register_loading_screen.dart';
import 'package:cardit/ui/select_country_screen/select_country_screen.dart';
import 'package:cardit/ui/update_psw_screen/update_password_code_screen.dart';
import 'package:cardit/ui/update_psw_screen/update_password_screen.dart';
import 'package:cardit/ui/verify_email_screen/verify_email_screen.dart';
import 'package:cardit/ui/verify_userid_screen/verify_userid_screen.dart';
import 'package:flutter/material.dart';

import 'ui/avator_screen/select_avatar_screen.dart';
import 'ui/login_screen/login_screen.dart';
import 'ui/manage_card_screen/add_card_screen.dart';
import 'ui/manage_card_screen/manula_card_screen.dart';
import 'ui/manage_card_screen/scan_card_screen.dart';
import 'ui/onboard_screen/onboard-seller-apply_screen.dart';
import 'ui/onboard_screen/onboard-seller_screen.dart';
import 'ui/payment_screen/payments_details_screen.dart';
import 'ui/payment_screen/payments_screen.dart';
import 'ui/profile_information_screen/profile_information_screen.dart';
import 'ui/register_screen/register_screen.dart';
import 'ui/setting_screen/settings_screen.dart';
import 'ui/user_detail_screen/user_details_screen.dart';
import 'ui/user_profile_screen/profile_screen.dart';

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
      case '/profileInformation':
        return MaterialPageRoute(builder: (_) => const ProfileInformation());
      case '/avatarPageView':
        return MaterialPageRoute(builder: (_) => const AvatarPageView());

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
