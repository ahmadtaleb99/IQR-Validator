import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqr_validator/routes.dart';
import 'package:iqr_validator/utils/constants.dart';
import 'package:iqr_validator/view/widgets/AuthButton.dart';
import 'package:iqr_validator/view/widgets/AuthTextFormField.dart';
import 'package:iqr_validator/view/widgets/CustomButton.dart';
import 'package:iqr_validator/services//FormValidation.dart';

class LoginScreen extends StatelessWidget with FormValidation {
  LoginScreen({Key? key}) : super(key: key);

  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Document Validator'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 50.w),
            child: Column(

              children: [
                Padding(
                    padding: EdgeInsets.all(30.0.h),
                    child: Container(
                      child: Image.asset('assets/images/iraqi_logo.png',
                          width: 200.h, height: 200.h, fit: BoxFit.fill),
                    )),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formGlobalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('اسم المستخدم',style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        AuthTextFromField(controller: _usernameController, obscureText: false, hintText: '******', validator: (userName){
                    if(!isValidUser(userName))
                      return 'اسم المستخدم غير صالح';

                    else return null;
                        }),
                        SizedBox(height: 20.h,),



                        Text('كلمة المرور',style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        AuthTextFromField(controller: _passwordController, obscureText: true, hintText: '******', validator: (password){
                          if(!isValidPassword(password))
                            return 'يجب أن تتكون كلمة المرور من 4 محارف على الأقل';

                          else return null;
                        }),
                        SizedBox(height: 80.h,),
                        AuthButton(
                            text: 'تسجيل دخول',
                            onPressed: () {
                              if(formGlobalKey.currentState!.validate() ){
                                Get.offNamed(Routes.homeScreen);
                              }

                            })


                      ],
                    )),
                // AuthButton(text: 'تسجيل دخول')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
