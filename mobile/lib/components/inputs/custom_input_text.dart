import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomInputText extends StatelessWidget {
  final String hintText;
  final bool isObscure;
  final bool isPassword;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputFormatter? inputFormatter;
  final VoidCallback? onToggle;
  final TextInputType keyboardType;

  const CustomInputText({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.keyboardType,
    this.validator,
    this.inputFormatter,
    this.isObscure = false,
    this.isPassword = false,
    this.onToggle,
  });

  Widget? _buildSuffixIcon() {
    if (isPassword) {
      return IconButton(
        icon: Icon(
          isObscure ? LucideIcons.eye : LucideIcons.eyeOff, 
          size: 24,
        ),
        onPressed: onToggle,
        splashRadius: 24,
      );
    } 
    else if (suffixIcon != null) {
      return Icon(suffixIcon, size: 24);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 24) : null,
        suffixIcon: _buildSuffixIcon(),
      ),
      validator: validator,
      inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
      textAlign: TextAlign.left,
      obscureText: isObscure,
      keyboardType: keyboardType,
    );
  }
}