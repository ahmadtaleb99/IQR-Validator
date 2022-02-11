import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqr_validator/utils/constants.dart';



class CustomAlertDialog extends StatelessWidget {
  final String title, descriptions, buttonText;
  final Icon titleIcon ;
  final Color color;
  final void Function() onPressed;
  const CustomAlertDialog(
      {
        Key ? key,
        required  this.title,
        required   this.descriptions,
      required this.buttonText,
      required this.titleIcon, required this.color, required this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return        Container(
      width: 250.w,
      
      decoration: BoxDecoration(

        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: color,

              borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
            ),
            height: 9.h,
            width: double.infinity,
          ),   Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              mainAxisSize: MainAxisSize.min,
              children: [
              Row(
                  textDirection: TextDirection.rtl,
                  children: [
                 titleIcon,
                    Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
                  ],
                ),
                SizedBox(height: 10.h,),
                Center(child: Text(descriptions,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 16.sp),)),
                SizedBox(height: 22.h,),



                ElevatedButton(

                            style: ElevatedButton.styleFrom(
                                primary: color
                            ),

                            onPressed: onPressed, child: Center(child: Text(buttonText))),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
