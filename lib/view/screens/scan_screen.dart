import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqr_validator/controller/QrScannerController.dart';
import 'package:iqr_validator/utils/constants.dart';
import 'package:iqr_validator/view/widgets/AlertWidget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  final qrController = Get.put(QrScannerController());




  //in order to perform hot reload
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController.controller!.pauseCamera();
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التحقق من صحة المستند'),
        centerTitle: true,
      ),
      body:                  Column(
        children: [
          Expanded(
            child:  QRView(
            overlay: QrScannerOverlayShape(
              borderLength: 14,
              borderWidth: 6,
              borderColor: Colors.grey
            ),
              key: qrController.qrKey,
              onQRViewCreated: (controller){
                qrController.createScan(controller);
              },
            ),
          ),
        ],
      )

    );

  }


}








