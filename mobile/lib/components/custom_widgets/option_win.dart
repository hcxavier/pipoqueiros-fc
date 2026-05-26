import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/constants/styles.dart';

class OptionWin extends StatelessWidget {
  final String? team;
  final bool value;
  final ValueChanged<bool> onChanged;

  const OptionWin({
    super.key,
    this.team,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(4),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF161618),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: const Color(0xFF2C2C2E),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              team != null 
                ? Image.asset('assets/teams/$team.png', width: 24, height: 24) 
                : Icon(LucideIcons.x, color: AppColors.textMuted, size: 22),
              const SizedBox(width: 4),
              team == null 
                ? Text('Empate', style: AppFonts.caption)
                : SizedBox(),
              const SizedBox(width: 3),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: value ? AppColors.yellowPrimary : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color(0xFF3A3A3C),
                    width: 1.5,
                  ),
                ),
                child: value
                  ? const Icon(Icons.check, size: 16, color: Colors.black)
                  : null,
              ),
            ],
          ),
        ),
    );
  }
}