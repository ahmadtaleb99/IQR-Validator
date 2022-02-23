// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:iqr_validator/controller/AboutController.dart';
import 'package:iqr_validator/utils/constants.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  final _aboutCotnroller = Get.find<AboutController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('عن التطبيق'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
                    child: Container(
                      child: Image.asset('assets/images/flex_logo.png',
                          width: 200.h, height: 200.h, fit: BoxFit.fill),
                    ),
                  ),
                ),
                GetBuilder<AboutController>(builder: (_) {
                  if (_aboutCotnroller.isLoading)
                    return SpinKitFadingFour(color: kBtncolor1);

                  if (_aboutCotnroller.aboutInfo.isEmpty) {
                    return Text(
                      'خطأ بالاتصال',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 33.sp,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    );
                  } else
                    return Text(
                      _aboutCotnroller.aboutInfo.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                      textDirection: TextDirection.rtl,
                    );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
