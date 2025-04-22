import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool isObscure;
  final TextEditingController controller;
  final String? Function(String?) validator;
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    required this.controller,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: MyTheme.black70),
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: MyTheme.white,
          hintText: hintText,
          hintStyle: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: MyTheme.black70),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        keyboardType: keyboardType,
        obscureText: isObscure,
        validator: validator,
      ),
    );
  }
}
