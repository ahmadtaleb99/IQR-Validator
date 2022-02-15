import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqr_validator/routes.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffexIcon;
  final String hintText;
  final Function validator;
  final void Function(String) ?  onFieldSubmitted;

  final TextInputAction textInputAction;
  const AuthTextFromField(
      {Key? key,
        required this.controller,
        required this.obscureText,
        this.prefixIcon,
        required this.hintText,
        required this.validator, this.suffexIcon, required this.textInputAction, this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      textDirection: TextDirection.rtl,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) => validator(value),
      controller: controller,
      obscureText: obscureText,
      autovalidateMode:  AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(


        hintTextDirection: TextDirection.rtl,
        suffixIcon: suffexIcon,
        fillColor: Colors.white,
        prefixIcon: prefixIcon,
        filled: true,
        hintText: hintText,
        errorStyle: const TextStyle(),
        hintStyle:  TextStyle(
         color: Colors.grey.withOpacity(0.250)
        ),
        enabledBorder: OutlineInputBorder(

            borderSide:  BorderSide(color: Colors.grey.withOpacity(0.250)),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.grey.withOpacity(0.250)),
            borderRadius: BorderRadius.circular(5)),
        errorBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.grey.withOpacity(0.250)),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
