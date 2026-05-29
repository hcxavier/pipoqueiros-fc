import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class SecondaryButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final bool square;
  final bool exit;
  final bool isdark;
  final VoidCallback? onPressed;

  const SecondaryButton({super.key, this.square = false, this.text, this.icon, this.exit = false, this.onPressed, this.isdark = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
      ),
      child: SizedBox(
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
              Icon(icon, size: 24, color: AppColors.invert),
              if (!square) ...[
                const SizedBox(width: 10),
                Text(text ?? '', style: AppFonts.textButtonInvert),
              ],
            ],
          ),
        ),
      ),
    );
  }
}