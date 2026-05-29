import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class CustomDivider extends StatelessWidget {
  final String text;

  const CustomDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFF3A3A3C),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            text,
            style: AppFonts.captionBold,
          ),
        ),
        const Expanded(
          child: Divider(
            color: Color(0xFF3A3A3C),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}