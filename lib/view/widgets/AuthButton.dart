import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqr_validator/utils/constants.dart';

class AuthButton extends StatelessWidget {
  const AuthButton ({Key? key, required this.text, required this.onPressed}) : super(key: key);
      final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return         Container(
        height: 75.h,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: kBtncolor3),
            onPressed: onPressed,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(

                  fontWeight: FontWeight.bold, fontSize: 25 .sp),
            )))
    ;
  }
}
