import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressed, required this.color, required this.text, this.image}) : super(key: key);
  final void Function() onPressed;
  final Color color;
  final String text;
  final String ? image;

  @override
  Widget build(BuildContext context) {
    return               SizedBox(
      height: 75.h,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: color),
          onPressed: onPressed,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.end ,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(

                    fontWeight: FontWeight.bold, fontSize: 22.sp),
              ),
            SizedBox(
              width: 15.w,
            ),
            image != null ?  SizedBox(
              width: 50.w,
              height: 50.h,
              child: SvgPicture.asset(
                  image!,

                  color: Colors.white,
                ),
            ) : Container()
            ],
          )),
    )
    ;
  }
}
