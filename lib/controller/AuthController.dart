import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iqr_validator/routes.dart';
import 'package:iqr_validator/services/networking.dart';
import 'package:iqr_validator/utils/constants.dart';
import 'package:iqr_validator/view/widgets/CustomAlertDialog.dart';

class AuthController extends GetxController {
   String  ? access_token;
  final _loginBox = GetStorage();

  Future<void> loginUserAndPassword  ({required String userName, required String password}) async {


    try {
      showLoadingIndicator();
      var body = {'username': userName, 'password': password};
      Map<String, dynamic> response = await NetworkingHelper.postData(url: '$baseUrl/login', body: body);
        print(response);

      Get.back(closeOverlays: true);


      if (response['status'] == true) {
        access_token = response['access_token'];
        _loginBox.write('access_token', access_token);
        Get.offNamed(Routes.homeScreen);
      }

      else if (response['status'] == false) {


              if(response['message'] =="INACTIVE_ACCOUNT")
                {
                  Get.dialog(
                      CustomAlertDialog(
                          title: 'فشل تسجيل دخول',
                          descriptions: 'الحساب غير فعال',
                          buttonText: 'حسناً',
                          onPressed: () {
                            Get.back();
                          },
                          alertType: AlertType.ERROR),
                      barrierDismissible: false);
                }



          else {
                Get.dialog(
                    CustomAlertDialog(
                        title: 'فشل تسجيل دخول',
                        descriptions: 'اسم المستخدم أو كلمة المرور غير صحيحة',
                        buttonText: 'حسناً',
                        onPressed: () {
                          Get.back();
                        },
                        alertType: AlertType.ERROR),
                    barrierDismissible: false);
              }
      }


    } on TimeoutException {
     showInternetErrorDialog();
    } catch (e) {
      showInternetErrorDialog();
    }
  }

  void logout(){
    _loginBox.remove('access_token');
    Get.offAllNamed(Routes.loginSceen);
  }

  @override
  void onInit() {
    super.onInit();
    access_token = _loginBox.read('access_token');
    print(access_token);
  }
}


