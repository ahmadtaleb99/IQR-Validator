

import 'package:get/get.dart';
import 'package:iqr_validator/view/screens/LoginScreen.dart';
import 'package:iqr_validator/view/screens/about_screen.dart';
import 'package:iqr_validator/view/screens/home_screen.dart';
import 'package:iqr_validator/view/screens/scan_screen.dart';

class AppRoutes {

  static final routes = [
    GetPage (name: Routes.homeScreen , page: () => const HomeScreen() ),
    GetPage (name: Routes.loginSceen , page: () => LoginScreen() ),
    GetPage (name: Routes.aboutScreen , page: () => const AboutScreen() ),
    GetPage (name: Routes.scanScreen , page: () => const ScanScreen() ),
  ];

}

class Routes {


  static const String homeScreen = '/HomeScreen';
  static const String loginSceen = '/LoginScreen';
  static const String aboutScreen = '/AboutScreen';
  static const String scanScreen = '/ScanScreen';
}