import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqr_validator/logic/controller/QrScannerController.dart';
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
    children: <Widget>[
    Expanded(
      flex: 5,
      child:  QRView(
        key: qrController.qrKey,
        onQRViewCreated: (crtl){
          qrController.createScan(crtl,context);
        },
      ),
    ),



    ],
    )

    );

  }


}








