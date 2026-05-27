import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/ui/view_models/home_view_model.dart';

import 'package:provider/provider.dart';
import 'package:mobile/ui/view_models/settings_view_model.dart';

class CustomNavigationBar extends StatelessWidget {
  final PageController pageController;
  final HomeViewModel viewModel;

  const CustomNavigationBar({super.key, required this.pageController, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    context.watch<SettingsViewModel>();
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
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
            _buildNavItem(LucideIcons.trophy, 1, "Ranking", viewModel),
            _buildNavItem(Icons.sports_soccer, 2, "Meus bolões", viewModel),
            _buildNavItem(LucideIcons.search, 3, "Buscar bolões", viewModel),
            _buildNavItem(LucideIcons.settings, 4, "Configurações", viewModel),
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
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                sessionName,
                style: AppFonts.caption.copyWith(
                  color: isSelected ? AppColors.yellowPrimary : AppColors.textMuted,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}