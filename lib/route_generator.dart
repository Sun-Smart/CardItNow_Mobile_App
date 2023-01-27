// ignore_for_file: prefer_const_constructors

import 'package:cardit/ui/dashboard/paynow_menu/dashboard_payment_screen.dart';
import 'package:cardit/ui/dashboard/paynow_menu/select_documents_screen.dart';
import 'package:cardit/ui/dashboard/paynow_menu/select_recipient_screen.dart';
import 'package:cardit/ui/landingscreens/choose_LPG_screen.dart';
import 'package:cardit/ui/landingscreens/loans-payment_screen.dart';
import 'package:cardit/ui/landingscreens/loans_screen.dart';
import 'package:cardit/ui/loan_screen/loan_amount.dart';
import 'package:cardit/ui/loan_screen/payment_overview.dart';
import 'package:cardit/ui/loan_screen/payment_successful.dart';
import 'package:cardit/ui/loan_screen/verify_bank_details.dart';
import 'package:cardit/ui/onboard_screen/onboard-seller-load_screen.dart';
import 'package:cardit/ui/register/4digit_passcode_screen.dart';
import 'package:cardit/ui/register/register_loading_screen.dart';
import 'package:cardit/ui/register/select_country_screen.dart';
import 'package:cardit/ui/splash_screen/splash2.dart';
import 'package:cardit/ui/splash_screen/splash_screen.dart';
import 'package:cardit/ui/update_psw_screen/update_password_code_screen.dart';
import 'package:cardit/ui/update_psw_screen/update_password_screen.dart';
import 'package:flutter/material.dart';

import 'ui/landingscreens/dashbord_screen.dart';
import 'ui/landingscreens/payments_details_screen.dart';
import 'ui/landingscreens/payments_screen.dart';
import 'ui/landingscreens/profile_screen.dart';
import 'ui/landingscreens/scan_card_screen.dart';
import 'ui/landingscreens/settings_screen.dart';
import 'ui/landingscreens/user_details_screen.dart';
import 'ui/login/login_screen.dart';
import 'ui/onboard_screen/onboard-seller-apply_screen.dart';
import 'ui/onboard_screen/onboard-seller_screen.dart';
import 'ui/payment_method/manula_card_screen.dart';
import 'ui/register/profile_information_screen.dart';
import 'ui/register/select_avatar_screen.dart';
import 'ui/splash_screen/splash_screen.dart';
import 'ui/startingscreen/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        // const SplashScreens()
        //const ChoosePaymentPage()
        return MaterialPageRoute(builder: (_) => const SplashScreens());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/splash2':
        return MaterialPageRoute(builder: (_) => const splash2());
      case '/selectcountry':
        return MaterialPageRoute(builder: (_) => const Selectcountry());
      case '/4digitpasscode':
        return MaterialPageRoute(builder: (_) => const Passcode());
      case '/updatepasswordcode':
        return MaterialPageRoute(builder: (_) => const UpdatePasswordCode());
      case '/updatepassword':
        return MaterialPageRoute(builder: (_) => const UpdatePassword());
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
      case '/scanCard':
        return MaterialPageRoute(builder: (_) => const ScanCard());
      case '/manualCard':
        return MaterialPageRoute(builder: (_) => const ManualCard());
      case '/profileInformation':
        return MaterialPageRoute(builder: (_) => const ProfileInformation());
      case '/avatarPageView':
        return MaterialPageRoute(builder: (_) => const AvatarPageView());
      case '/loanamount':
        return MaterialPageRoute(builder: (_) => LoanAmount());
      case '/bankdetails':
        return MaterialPageRoute(builder: (_) => BankDetails());
      case '/paymentoverview':
        return MaterialPageRoute(builder: (_) => PaymentOverview());
      case '/paymentsuccess':
        return MaterialPageRoute(builder: (_) => PaymentSuccessful());
      case '/payment_dashboard':
        return MaterialPageRoute(builder: (_) => PaymentDashboard());
      case '/selecttypeofrecipient':
        return MaterialPageRoute(builder: (_) => RecipientType());
      case '/selectdocuments':
        return MaterialPageRoute(builder: (_) => SelectDocuments());
      // case '/onboardrecipient':
      //   return MaterialPageRoute(builder: (_) => onboardRecipient());
      case '/chooseLPG':
        return MaterialPageRoute(builder: (_) => ChooseLPG());

//git push

      default:
        return _errorRoute();
    }
  }

//routing
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
