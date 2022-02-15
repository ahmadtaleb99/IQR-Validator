import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iqr_validator/routes.dart';
import 'package:iqr_validator/utils/constants.dart';


Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();
  await GetStorage.init();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
          designSize: const Size(392, 769),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: () {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              builder: (context, widget) {

                ScreenUtil.setContext(context);
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!
                );
              },
              theme: light,
              // theme: ThemeData.light(),
              // darkTheme: ThemeData.dark(),
              initialRoute:  Routes.loginSceen,//FirebaseAuth.instance.currentUser != null || AuthController().authBox.read('isSignedIN') ? Routes.mainScreen : Routes.welcomeScreen ,
              getPages: AppRoutes.routes,
            );
          },

   );}
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext ? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}