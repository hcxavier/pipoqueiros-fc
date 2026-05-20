import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/ui/view_models/home_view_model.dart';

class CustomNavigationBar extends StatelessWidget {
  final PageController pageController;
  final HomeViewModel viewModel;

  const CustomNavigationBar({super.key, required this.pageController, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(LucideIcons.plusCircle, 0, "Novo bolão", viewModel),
            _buildNavItem(Icons.sports_soccer, 1, "Meus bolões", viewModel),
            _buildNavItem(LucideIcons.search, 2, "Buscar bolões", viewModel),
            _buildNavItem(LucideIcons.settings, 3, "Configurações", viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, String sessionName, HomeViewModel viewModel) {
    bool isSelected = viewModel.currentIndex == index;
    
    return GestureDetector(
      onTap: () {
        viewModel.setIndex(index);
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.yellowPrimary : AppColors.textMuted,
              size: 24,
            ),
            ?isSelected ? SizedBox(width: 8) : null,
            ?isSelected ? Text(sessionName, style: AppFonts.caption.copyWith(color: isSelected ? AppColors.yellowPrimary : AppColors.textMuted),
            ) : null,
          ],
        ),
      ),
    );
  }
}