import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqr_validator/utils/constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

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
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h, horizontal:25.w),
                  child: Container(
                    child: Image.asset('assets/images/flex_logo.png',
                        width: 200.h, height: 200.h, fit: BoxFit.fill),
                  ),
                ),

                const Text(kAboutText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
