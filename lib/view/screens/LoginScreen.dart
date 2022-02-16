import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:iqr_validator/controller/AuthController.dart';
import 'package:iqr_validator/routes.dart';
import 'package:iqr_validator/utils/constants.dart';
import 'package:iqr_validator/view/widgets/AuthButton.dart';
import 'package:iqr_validator/view/widgets/AuthTextFormField.dart';
import 'package:iqr_validator/view/widgets/CustomButton.dart';
import 'package:iqr_validator/services//FormValidation.dart';

class LoginScreen extends StatelessWidget with FormValidation {
  LoginScreen({Key? key}) : super(key: key);
  final _authController = Get.find<AuthController>();
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  String userName='';
  String password='';

  @override
  Widget build(BuildContext context) {
    _usernameController.text ='ahmad';
    _passwordController.text ='ahmad';
    var  _submited =  AutovalidateMode.disabled ;
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
                  // autovalidateMode: _submited,
                    key: formGlobalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('اسم المستخدم',style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: AuthTextFromField(controller: _usernameController, textInputAction: TextInputAction.next,obscureText: false, hintText: '******', validator: (userName){
                    if(!isValidUser(userName))
                      return 'اسم المستخدم غير صالح';

                    else return null;
                          }),
                        ),
                        SizedBox(height: 20.h,),



                      const  Text('كلمة المرور',style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        Directionality(
                          textDirection: TextDirection.rtl,

                          child: AuthTextFromField(controller: _passwordController,  textInputAction: TextInputAction.done,obscureText: true, hintText: '******',onFieldSubmitted: (text){
                            _login();
                          }, validator: (password){
                            if(!isValidPassword(password))
                              return 'يجب أن تتكون كلمة المرور من 4 محارف على الأقل';

                            else return null;
                          }),
                        ),
                        SizedBox(height: 80.h,),
                        AuthButton(
                            text: 'تسجيل دخول',
                            onPressed: () {
                            _login();

                            }),


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

  void _login(){
    userName = _usernameController.text;
    password = _passwordController.text;
    if(formGlobalKey.currentState!.validate() ){
      _authController.loginUserAndPassword(userName: userName, password: password);
      // if(_authController.isLoading)
      // Get.offNamed(Routes.homeScreen);
    }
  }

}
