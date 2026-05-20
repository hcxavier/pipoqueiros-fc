import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/constants/styles.dart';

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
    return AppBar(
      backgroundColor: AppColors.bgSecondary,
      leading: onLeftPressed != null
          ? IconButton(
              icon: const Icon(LucideIcons.chevronLeft, color: Colors.white),
              onPressed: onLeftPressed,
            )
          : null,
      actions: [
        onRightPressed != null
          ? IconButton(
              icon: const Icon(LucideIcons.share, color: Colors.white),
              onPressed: onRightPressed,
            )
          : SizedBox.shrink(),
      ],
      title: Text(
        title,
        style: AppFonts.titleMedium.copyWith(color: Colors.white, fontSize: 18),
      ),
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
