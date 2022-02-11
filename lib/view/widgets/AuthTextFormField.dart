import 'package:flutter/material.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffexIcon;
  final String hintText;
  final Function validator;
  const AuthTextFromField(
      {Key? key,
        required this.controller,
        required this.obscureText,
        this.prefixIcon,
        required this.hintText,
        required this.validator, this.suffexIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,

      validator: (value) => validator(value),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        suffixIcon: suffexIcon,
        fillColor: Colors.white,
        prefixIcon: prefixIcon,

        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
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
