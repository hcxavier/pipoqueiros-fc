import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  bool get _isAsset {
    return _hasImagePath && imagePath!.startsWith('assets/');
  }

  bool get _hasImagePath {
    return imagePath != null && imagePath!.trim().isNotEmpty;
  }

  Widget _buildFallback() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.bgTertiary,
            AppColors.bgSecondary,
          ],
        ),
      ),
      child: Center(
        child: Text(
          _initial,
          style: GoogleFonts.roboto(
            fontSize: size * 0.38,
            fontWeight: FontWeight.w900,
            color: AppColors.yellowPrimary,
          ),
        ),
      ),
    );
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
                color: AppColors.yellowPrimary,
                width: 3,
              ),
              color: AppColors.bgSecondary,
            ),
            child: ClipOval(
             child: _hasImagePath
              ? (_isAsset ? Image.asset(
                  imagePath!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _buildFallback(),
                ): Image.file(
                  File(imagePath!),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _buildFallback(),
                )
              ) : _buildFallback(),
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
                  color: AppColors.yellowPrimary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  LucideIcons.edit,
                  color: AppColors.bgPrimary,
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