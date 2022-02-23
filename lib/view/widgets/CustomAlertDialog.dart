import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqr_validator/utils/constants.dart';
import 'package:iqr_validator/utils/enums.dart';




class CustomAlertDialog extends StatelessWidget {
  final String title, descriptions, buttonText;
  final AlertType alertType;
  final void Function() onPressed;
  const CustomAlertDialog(
      {
        Key ? key,
        required  this.title,
        required   this.descriptions,
      required this.buttonText,
      required this.onPressed, required this.alertType}) : super(key: key);






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
              color: alertType == AlertType.ERROR ? kNotFoundQr : kFoundQr ,

              borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
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
              Directionality(
                textDirection: TextDirection.rtl
                ,child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                    // textDirection: TextDirection.rtl,
                    children: [
                      alertType == AlertType.SUCCESS ? const Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: Icon(
                          Icons.check_circle,
                          color: kFoundQr,
                          size: 30,
            ),
                      ) :
                      const Padding(
                        padding: EdgeInsets.only(top: 3.6),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: kNotFoundQr,
                          child:  Icon(
                            Icons.close_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(width: 15.w),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(height: 5.h,),
                            Text(descriptions,textDirection: TextDirection.rtl,style: const TextStyle(fontSize: 19)),

                          ],
                        ),
                      ),
                    ],
                  ),
              ),
                SizedBox(height: 25.h,),



                ElevatedButton(

                            style: ElevatedButton.styleFrom(
                                primary:  alertType == AlertType.ERROR ? kNotFoundQr : kFoundQr ,

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
