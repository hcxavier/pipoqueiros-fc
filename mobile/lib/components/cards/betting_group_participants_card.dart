import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class BettingGroupParticipantsCard extends StatelessWidget {
  final String title;
  final String content;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;

  const BettingGroupParticipantsCard({
    super.key,
    required this.title,
    required this.content,
    this.prefix,
    this.suffix,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(4),
          border: const Border(
            bottom: BorderSide(color: AppColors.yellowPrimary, width: 3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefix ?? const SizedBox.shrink(),
            prefix != null ? const SizedBox(width: 16) : const SizedBox.shrink(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: TextStyle(
                      color: AppColors.textSecondary.withValues(alpha: 0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            suffix ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}