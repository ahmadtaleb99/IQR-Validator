import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void ShowAlertWidget(BuildContext context) {
  showDialog(barrierDismissible: true,
      context: context,
      builder: (context)
  {
    return Dialog(
      child: Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10,)


        ],
      ),
    );
  });
      // });
}