import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqr_validator/utils/constants.dart';
import 'package:iqr_validator/view/widgets/AuthButton.dart';
import 'package:iqr_validator/view/widgets/CustomAlertDialog.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerController extends GetxController {

  QRViewController? controller;
   // result = Rx<Barcode>();
  var result  = Barcode(null, BarcodeFormat.aztec, []).obs;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

   createScan(QRViewController controller,BuildContext context) {
     this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      result.value= scanData ;
      if(result.value.code != null){
        await controller.pauseCamera();

        showDialog(
            barrierColor: Colors.grey.withOpacity(0.8),
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                descriptions:
                'الرّمز صحيح  يرجى التأكد من المعلومات',
                title: 'تمت قراءة الرّمز',
                buttonText: 'الذهاب إلى موقع الويب',
                titleIcon: Icon(
                  Icons.check_circle,
                  color: kFoundQr,
                  size: 30,
                ),
                color: kFoundQr,
                onPressed: () async {
                  Get.back();
                  await controller.resumeCamera();
                },
              );
            });
      }
    });



   }


}


