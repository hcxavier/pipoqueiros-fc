import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class SecondaryButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final bool square;
  final bool exit; 
  final VoidCallback? onPressed;

  const SecondaryButton({super.key, this.square = false, this.text, this.icon, this.exit = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: !square ? double.infinity : 60,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: !exit ? AppColors.bgSecondaryButton: AppColors.bgError,
          side: BorderSide(color: !exit ? AppColors.yellowPrimary : AppColors.textError, width: 1),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: square ? AppColors.yellowPrimary : AppColors.white),
            if (!square) ...[
              const SizedBox(width: 10),
              Text(text ?? '', style: AppFonts.textButton),
            ],
          ],
        ),
      ),
    );
  }
}