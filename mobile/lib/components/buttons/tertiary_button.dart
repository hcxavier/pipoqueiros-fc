import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class TertiaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;

  const TertiaryButton({
    super.key, 
    this.text, 
    this.onPressed, 
    this.icon, 
    required this.isLoading
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.greenPrimary,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        ),
        child: isLoading ? const SizedBox(width: 21, height: 21, child: CircularProgressIndicator(color: AppColors.white)) : icon == null ? Text(text ?? '') : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: AppColors.white),
            SizedBox(width: 10),
            Text(text ?? '', style: AppFonts.captionBold.copyWith(color: AppColors.white)),
          ],
        ),
      ),
    );
  }
}