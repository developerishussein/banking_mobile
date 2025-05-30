import 'package:banking_mobile/screens/Login/login.dart';
import 'package:banking_mobile/screens/mynv.dart';
import 'package:get/get.dart';
import '../../screens/Add New Card/add_new_cardPage.dart';
import '../../screens/Home/home_page.dart';
import '../../screens/Onboarding/onboarding.dart';
import '../../screens/Register/register.dart';
import '../../screens/Request Money/request_money_page.dart';
import '../../screens/SplashScreen/splashscreen.dart';
import '../../screens/Terms & Condition/terms_condition.dart';

class AppRoutes {
  static const String splashscreen = '/';
  static const String onboarding = '/onboarding';
  static const String register = '/register';
  static const String homePage = '/homePage';
  static const String login = '/login';
  static const String mynv = '/mynv';
  static const String termsAndConditionPage = '/termsAndConditionPage';
    static const String requestMoneyPage = '/requestMoneyPage';
  static const String addNewCardPage = '/addNewCardPage';

  static final routes = [
    GetPage(name: splashscreen, page: () => Splashscreen()),
    GetPage(name: onboarding, page: () => Onboarding()),
    GetPage(name: register, page: () => Register()),
    GetPage(name: homePage, page: () => HomePage()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: mynv, page: () => Mynv()),
    GetPage(name: termsAndConditionPage, page: ()=>TermsAndConditionPage()),
        GetPage(name: requestMoneyPage, page: ()=>RequestMoneyPage()),
    GetPage(name: addNewCardPage, page: ()=>AddNewCardPage()),
  ];
}
