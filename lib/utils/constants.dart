import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqr_validator/view/widgets/CustomAlertDialog.dart';

import 'enums.dart';

const baseUrl = 'http://flexsolutions.biz/apps/doc-validator/api';


ThemeData light = ThemeData(
  backgroundColor: Colors.white,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    color: mainColor,
  )

);
const mainColor = Color(0xFF2F2B5B);
const kBtncolor1 =  Color(0xff008acd);
const kBtncolor2 =   Color(0xff4b58c1);
const kBtncolor3 =   Color(0xffffe562);
const kFoundQr =   Color(0xff32be73);
const kNotFoundQr =   Color(0xffe22c40);

void showLoadingIndicator({String ? text}) {

  Get.dialog(
      Center(
        child: Container(
          width: 110.w,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            color: Colors.white.withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SpinKitFadingFour(color:kBtncolor1),
                  const SizedBox(
                    height: 10,
                  ),
                   Text(
                    text ?? 'يرجى الانتظار ..' ,
                       textDirection : TextDirection.rtl,
                       style:  GoogleFonts.lato(textStyle: TextStyle(color: kBtncolor2,fontWeight: FontWeight.bold))
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.grey.withOpacity(0.2));
}

void showInternetErrorDialog(){
  Get.back();
  Get.dialog(
      CustomAlertDialog(
          title: 'مشكلة اتصال',
          descriptions: 'يرجى المحاولة مرة أخرى',
          buttonText: 'حسناً',
          onPressed: () {
            Get.back();
          },
          alertType: AlertType.ERROR),
      barrierDismissible: false);
}


const String kAboutText = 'Subjects to '
    'ecstatic children he. Could ye leave up as built match. Dejection agreeable attention set suspected led offending. Admitting an performed supposing by. Garden agreed matter are should formed temper had. Full held gay now roof whom such next was. Ham pretty our people moment put excuse narrow. Spite mirth money six above get going great own. Started now shortly had for assured hearing expense. Led juvenile his laughing speedily put pleasant relation offering.Subjects to '
    'ecstatic children he. Could ye leave up as built match. Dejection agreeable attention set suspected led offending. Admitting an performed supposing by. Garden agreed matter are should formed temper had. Full held gay now roof whom such next was. Ham pretty our people moment put excuse narrow. Spite mirth money six above get going great own. Started now shortly had for assured hearing expense. Led juvenile his laughing speedily put pleasant relation offering.';