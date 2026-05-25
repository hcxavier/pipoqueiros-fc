import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;

  const PrimaryButton({super.key, this.text, this.onPressed, this.icon, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        child: isLoading ? const SizedBox(width: 21, height: 21, child: CircularProgressIndicator(color: AppColors.black)) : icon == null ? Text(text ?? '') : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: AppColors.black),
            SizedBox(width: 10),
            Text(text ?? '', style: AppFonts.textButton),
          ],
        ),
      ),
    );
  }
}