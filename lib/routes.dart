

import 'package:get/get.dart';
import 'package:iqr_validator/view/screens/LoginScreen.dart';
import 'package:iqr_validator/view/screens/about_screen.dart';
import 'package:iqr_validator/view/screens/home_screen.dart';
import 'package:iqr_validator/view/screens/scan_screen.dart';

import 'bindings/AboutBinding.dart';
import 'bindings/AuthBinding.dart';

class AppRoutes {

  static final routes = [
    GetPage (name: Routes.homeScreen , page: () =>  HomeScreen() ),
    GetPage (name: Routes.loginScreen , page: () => LoginScreen() ),
    GetPage (name: Routes.aboutScreen , page: () =>  AboutScreen() ,binding: AboutBinding()),
    GetPage (name: Routes.scanScreen , page: () => const ScanScreen() ,binding: AuthBinding()),
  ];

}

class Routes {


  static const String homeScreen = '/HomeScreen';
  static const String loginScreen = '/LoginScreen';
  static const String aboutScreen = '/AboutScreen';
  static const String scanScreen = '/ScanScreen';
}