import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqr_validator/routes.dart';
import 'package:iqr_validator/utils/constants.dart';
import 'package:iqr_validator/view/widgets/AuthButton.dart';
import 'package:iqr_validator/view/widgets/CustomButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Document Validator'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            child: Image.asset(
                          'assets/images/iraqi_logo.png',
                          fit: BoxFit.fill,
                        )),
                      ),
                      Expanded(
                        child: Container(
                          child: Image.asset('assets/images/flex_logo.png',
                              fit: BoxFit.fill),
                        ),
                      )
                    ],
                  ),
                ),
                CustomButton(
                    onPressed: () {
                      Get.toNamed(Routes.scanScreen);
                    },
                    color: kBtncolor1,
                    text: 'تحقق من صحة المستند',
                    image: 'assets/images/scan.svg'),
                SizedBox(
                  height: 23.h,
                ),
                CustomButton(
                  onPressed: () {
                    Get.toNamed(Routes.aboutScreen);
                  },
                  color: kBtncolor2,
                  text: 'عن التطبيق',
                  image: 'assets/images/about.svg',
                ),
                SizedBox(
                  height: 157.h,
                ),
                AuthButton(
                    text: 'تسجيل خروج',
                    onPressed: () {

                    }
            ),
          ]),
        ),
      ),
    ));
  }
}
