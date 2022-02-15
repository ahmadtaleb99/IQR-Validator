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
  late final String access_token;
  final loginBox = GetStorage();
  void _showLoadingIndicator() {
    Get.dialog(
        Center(
          child: Container(
            width: 100,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              color: Colors.white.withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SpinKitFadingFour(color: Colors.blue),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Loading ..',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
        barrierColor: Colors.grey.withOpacity(0.2));
  }

  Future<void> loginUserAndPassword  ({required String userName, required String password}) async {


    try {
      _showLoadingIndicator();
      var body = {'username': userName, 'password': password};
      Map<String, dynamic> response = await NetworkingHelper.postData(url: '$baseUrl/login', body: body);


      Get.back(closeOverlays: true);


      if (response['status'] == true) {
        access_token = response['access_token'];
        loginBox.write('access_token', access_token);
        Get.offNamed(Routes.homeScreen);
      }

      else if (response['status'] == false) {


              if(response['message'] =='USER_INACTIVE')
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
      Get.dialog(
          CustomAlertDialog(
              title: 'فشل الاتصال',
              descriptions: 'يرجى المحاولة مرة أخرى',
              buttonText: 'حسناً',
              onPressed: () {
                Get.back(closeOverlays: true);
              },
              alertType: AlertType.ERROR),
          barrierDismissible: false);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    loginBox.read('access_token');
  }
}
