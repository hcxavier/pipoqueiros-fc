import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/constants/styles.dart';

class AvatarPerfil extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final double size;
  final VoidCallback? onEditTap;

  const AvatarPerfil({
    super.key,
    this.imagePath,
    this.name,
    this.size = 150,
    this.onEditTap,
  });

  String get _initial {
    if (name == null || name!.trim().isEmpty) {
      return '?';
    }

    return name!.trim()[0].toUpperCase();
  }

  bool get _hasImage {
    return imagePath != null && imagePath!.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.bgTertiary,
                width: 4,
              ),
              color: Colors.white,
            ),
            child: ClipOval(
              child: _hasImage
                  ? Image.file(
                      File(imagePath!),
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Text(
                        _initial,
                        style: TextStyle(
                          fontSize: size * 0.38,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2B2B2B),
                        ),
                      ),
                    ),
            ),
          ),

          Positioned(
            top: 6,
            right: 0,
            child: GestureDetector(
              onTap: onEditTap,
              child: Container(
                width: size * 0.28,
                height: size * 0.28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bgTertiary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  LucideIcons.edit,
                  color: AppColors.yellowPrimary,
                  size: size * 0.14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}