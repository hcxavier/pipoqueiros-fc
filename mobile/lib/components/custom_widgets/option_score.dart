import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class OptionScore extends StatelessWidget {
  final String team;
  final bool left;
  final TextEditingController controller;

  const OptionScore({
    super.key,
    required this.team,
    this.left = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.borderInput,
          width: 1.5,
        ),
      ),
      child: Row(
        textDirection: left ? TextDirection.rtl : TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/teams/$team.png',
            width: 24,
            height: 24,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.shield,
              color: AppColors.textMuted,
              size: 24,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 32,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: AppColors.yellowPrimary,
              style: AppFonts.inputText.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: '0',
                hintStyle: TextStyle(color: AppColors.textMuted),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
