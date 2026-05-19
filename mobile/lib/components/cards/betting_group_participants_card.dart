import 'package:flutter/material.dart';
import 'package:mobile/components/custom_widgets/avatar_stack.dart';
import 'package:mobile/constants/styles.dart';

class BettingGroupParticipantsCard extends StatelessWidget {
  final String title;
  final String creator;
  final List<String> avatarUrls;
  final int additionalCount;
  final VoidCallback onTap;

  const BettingGroupParticipantsCard({
    super.key,
    required this.title,
    required this.creator,
    required this.avatarUrls,
    this.additionalCount = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(4),
          border: const Border(
            bottom: BorderSide(color: AppColors.yellowPrimary, width: 3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Criado por $creator',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            AvatarStack(
              imageUrls: avatarUrls,
              additionalCount: additionalCount,
            ),
          ],
        ),
      ),
    );
  }
}
