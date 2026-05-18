import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomInputText({super.key, this.hintText, this.prefixIcon, this.obscureText, this.keyboardType, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    bool visible = obscureText ?? false;

    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: visible,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 24) : null,
        suffixIcon: visible ? IconButton(
          icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {visible = !visible;},
        ) : null,
      ),
    );
  }
}