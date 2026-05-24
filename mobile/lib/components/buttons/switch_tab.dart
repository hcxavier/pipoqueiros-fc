import 'package:flutter/material.dart';
import 'package:mobile/components/custom_widgets/build_tab_button.dart';
import 'package:mobile/constants/styles.dart';

class SwitchTab extends StatelessWidget {
  final int selectedTabIndex;
  final Function(int) onTabSelected;
  final List<String> tabTitles;

  const SwitchTab({
    super.key,
    required this.selectedTabIndex,
    required this.onTabSelected,
    required this.tabTitles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: List.generate(
          tabTitles.length,
          (index) => BuildTabButton(
            title: tabTitles[index],
            isSelected: selectedTabIndex == index,
            onTap: () => onTabSelected(index),
          ),
        ),
      ),
    );
  }
}