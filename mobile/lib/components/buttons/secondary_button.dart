import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class SecondaryButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final bool square;
  final VoidCallback? onPressed;

  const SecondaryButton({super.key, this.square = false, this.text, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: !square ? double.infinity : 60,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.bgSecondaryButton,
          side: BorderSide(color: AppColors.yellowPrimary, width: 1),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24),
            ?!square ? SizedBox(width: 10) : null,
            ?!square ? Text(text ?? '', style: AppFonts.textButton) : null,
          ],
        ),
      ),
    );
  }
}