import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/constants/styles.dart';

import 'package:provider/provider.dart';
import 'package:mobile/ui/view_models/settings_view_model.dart';

class AppBarTop extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;

  const AppBarTop({
    super.key,
    required this.title,
    this.onLeftPressed,
    this.onRightPressed,
  });

  @override
  Widget build(BuildContext context) {
    context.watch<SettingsViewModel>();
    return AppBar(
      backgroundColor: AppColors.bgSecondary,
      scrolledUnderElevation: 0,
      leading: onLeftPressed != null
          ? IconButton(
              icon: Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
              onPressed: onLeftPressed,
            )
          : null,
      actions: [
        onRightPressed != null
          ? IconButton(
              icon: Icon(LucideIcons.share, color: AppColors.textPrimary),
              onPressed: onRightPressed,
            )
          : SizedBox.shrink(),
      ],
      title: Text(
        title,
        style: AppFonts.titleMedium.copyWith(color: AppColors.textPrimary, fontSize: 18),
      ),
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
