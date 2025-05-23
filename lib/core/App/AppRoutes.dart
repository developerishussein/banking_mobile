import 'package:banking_mobile/screens/Login/Login.dart';
import 'package:banking_mobile/screens/mynv.dart';
import 'package:get/get.dart';
import '../../screens/Home/home_page.dart';
import '../../screens/Onboarding/Onboarding.dart';
import '../../screens/Register/Register.dart';
import '../../screens/SplashScreen/SplashScreen.dart';
import '../../screens/Terms & Condition/Terms&Condition.dart';

class AppRoutes {
  static const String splashscreen = '/';
  static const String onboarding = '/onboarding';
  static const String register = '/register';
  static const String homePage = '/homePage';
  static const String login = '/login';
  static const String mynv = '/mynv';
  static const String termsAndConditionPage = '/termsAndConditionPage';

  static final routes = [
    GetPage(name: splashscreen, page: () => Splashscreen()),
    GetPage(name: onboarding, page: () => Onboarding()),
    GetPage(name: register, page: () => Register()),
    GetPage(name: homePage, page: () => HomePage()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: mynv, page: () => Mynv()),
    GetPage(name: termsAndConditionPage, page: ()=>TermsAndConditionPage())
  ];
}
