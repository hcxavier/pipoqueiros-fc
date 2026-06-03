import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/constants/styles.dart';

class GoogleButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;

  const GoogleButton({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo/logo_google.svg',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 10),
            Text(text ?? '', style: AppFonts.textButtonInvert),
          ],
        ),
      ),
    );
  }
}
