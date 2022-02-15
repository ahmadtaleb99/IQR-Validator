import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqr_validator/controller/AuthController.dart';
import 'package:iqr_validator/services/networking.dart';
import 'package:iqr_validator/utils/constants.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerController extends GetxController {
  final _authController = Get.find<AuthController>();
  QRViewController? controller;
   // result = Rx<Barcode>();
   final    _result = Barcode(null,BarcodeFormat.aztec,null).obs;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

   createScan(QRViewController controller) {
     this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      _result.value= scanData ;
      if(_result.value.code != null){

        var headers = {
          'Authorization' : 'bearer ${_authController.access_token}'
        };
        var body = {
          'data' : _result.value.code
        };


        await controller.pauseCamera();

        var response = await  NetworkingHelper.postData(url: baseUrl+'/scan-qr',body:body ,headers: headers);
        if(response['status'] == true){
          await Get.dialog(
           Container(),
          barrierDismissible: false,
              barrierColor: Colors.grey.withOpacity(0.8),
              );
        }
        else if(response['status'] == false)
          // {
          //   await showDialog(
          //       barrierDismissible: false,
          //       barrierColor: Colors.grey.withOpacity(0.8),
          //       context: context,
          //       builder: (BuildContext context) {
          //         // return CustomAlertDialog(
          //         //   descriptions:
          //         //   'الرّمز صحيح  يرجى التأكد من المعلومات',
          //         //   title: 'تمت قراءة الرّمز',
          //         //   buttonText: 'الذهاب إلى موقع الويب',
          //         //   titleIcon: Icon(
          //         //     Icons.check_circle,
          //         //     color: kNoFoundQr,
          //         //     size: 30,
          //         //   ),
          //         //   color: kFoundQr,
          //         //   onPressed: () async {
          //         //     Get.back();
          //         //   },
          //         // );
          //       return Container();
          //       });
          // }

        await controller.resumeCamera();

      }
    });



   }


}


