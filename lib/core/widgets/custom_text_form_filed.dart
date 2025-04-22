import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? BorderColor;
  final double RadiusSize;
  final TextInputType keyboardType;
  final bool isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onchange;
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    this.onchange,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    required this.controller,
    this.validator, this.prefixIcon, this.BorderColor=Colors.white,  this.RadiusSize=15,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: onchange,
        style: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(
          fontSize: 15,
            color: MyTheme.black70),
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(0),
            child: prefixIcon,
          ),
          //prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
          filled: true,
          fillColor: MyTheme.white,
          hintText: hintText,
          hintStyle: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(
              fontSize: 15,
              color: MyTheme.black70),
          enabledBorder: CustomBorder(),
          border: CustomBorder(),
          focusedBorder: CustomBorder(),
          disabledBorder: CustomBorder()
        ),

        keyboardType: keyboardType,
        obscureText: isObscure,
        validator: validator,
      ),
    );
  }
   CustomBorder(){
    return OutlineInputBorder(
        borderSide: BorderSide(color: BorderColor!),
        borderRadius: BorderRadius.circular(RadiusSize));
  }
}


