import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqr_validator/controller/AuthController.dart';
import 'package:iqr_validator/services/networking.dart';
import 'package:iqr_validator/utils/constants.dart';
import 'package:iqr_validator/utils/enums.dart';
import 'package:iqr_validator/view/widgets/CustomAlertDialog.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerController extends GetxController {


  final _authController = Get.find<AuthController>();
  QRViewController? controller;
   final    _result = Barcode(null,BarcodeFormat.aztec,null).obs;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');



   createScan(QRViewController controller) {
     this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      _result.value= scanData ;
      if(_result.value.code != null){
        await controller.pauseCamera();

        try {
          showLoadingIndicator(text:' جاري قراءة  \n     الرمز ..');
          var headers = {
            'Authorization' : 'bearer ${_authController.access_token}'
          };
          var body = {
            'data' : _result.value.code
          };



          var response = await  NetworkingHelper.postData(url: baseUrl+'/scan-qr',body:body ,headers: headers);
         Get.back();

          if( (response['status'] == false) &&  (response['message'] == 'INVALID_TOKEN'))
          {
           await Get.dialog(
                CustomAlertDialog(
                    title: 'مشكلة على الحساب',
                    descriptions: 'الحساب غير فعال',
                    buttonText: 'حسناً',
                    onPressed: () {
                      _authController.logout();

                    },
                    alertType: AlertType.ERROR),


                barrierDismissible: false);

            return;
          }



          if(response['status'] == true){

            await Get.dialog(
              CustomAlertDialog(title: 'تمت قراءة الرّمز', descriptions: 'الرمز صحيح يرجى التأكد من المعلومات', buttonText: 'الذهاب إلى موقع الويب', onPressed: (){
                Get.back();
              }, alertType: AlertType.SUCCESS),
              barrierDismissible: false,
              barrierColor: Colors.grey.withOpacity(0.8),

            );

          }
          else if(response['status'] == false) {
            await Get.dialog(
              CustomAlertDialog(title: 'تمت قراءة الرّمز',
                  descriptions: 'الرمز غير صحيح',
                  buttonText: 'حسناً',
                  onPressed: () {
                    Get.back();
                  },
                  alertType: AlertType.ERROR),
              barrierDismissible: false,
              barrierColor: Colors.grey.withOpacity(0.8),

            );
          }
          await controller.resumeCamera();

        }
        catch (e){
          await showInternetErrorDialog();
          await controller.resumeCamera();
        }
      }
    });



   }


}


