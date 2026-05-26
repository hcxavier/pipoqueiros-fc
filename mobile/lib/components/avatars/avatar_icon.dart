import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class AvatarIcon extends StatelessWidget {
  final String? image;
  final IconData? icon;
  final String? name;
  final double radius;
  final Color? borderColor;
  final double borderWidth;

  const AvatarIcon({
    super.key,
    required this.radius,
    this.image,
    this.icon,
    this.name,
    this.borderColor,
    this.borderWidth = 3.0,
  });

  Widget? _buildContent() {
    if (image != null && image!.isNotEmpty) {
      return null;
    }

    if (icon != null) {
      return Icon(
        icon,
        color: AppColors.yellowPrimary,
        size: radius,
      );
    }
    
    if (name != null && name!.isNotEmpty) {
      return Text(
        name![0].toUpperCase(),
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: radius,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return null; 
  }

  @override
  Widget build(BuildContext context) {
    final bool hasBorder = borderColor != null;

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.bgTertiary,

        border: hasBorder
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
            
        image: image != null && image!.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(image!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      alignment: Alignment.center,
      child: _buildContent(),
    );
  }
}