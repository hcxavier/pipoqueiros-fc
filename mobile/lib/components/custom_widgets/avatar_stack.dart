import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/constants/styles.dart';

class AvatarStack extends StatelessWidget {
  final List<String> imageUrls;
  final int additionalCount;

  const AvatarStack({
    super.key,
    required this.imageUrls,
    this.additionalCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (var i = 0; i < imageUrls.length; i++) {
      children.add(
        Align(
          widthFactor: 0.7,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.bgSecondary, width: 2),
            ),
            child: _buildAvatar(imageUrls[i]),
          ),
        ),
      );
    }

    if (additionalCount > 0) {
      children.add(
        Align(
          widthFactor: 0.8,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[800],
              border: Border.all(color: AppColors.bgSecondary, width: 2),
            ),
            child: Text(
              '+$additionalCount',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    if (imageUrls.isEmpty && additionalCount == 0) {
      children.add(
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[800],
          ),
          child: const Text(
            '0',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget _buildAvatar(String url) {
    if (!url.startsWith('initials:')) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    final parts = url.split(':');
    final name = parts.length > 2 ? parts[2] : '';
    final color = _getDeterministicColor(name);
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            color.withValues(alpha: 0.7),
          ],
        ),
      ),
      child: Center(
        child: Text(
          parts.length > 1 ? parts[1] : '',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Color _getDeterministicColor(String name) {
    const colors = [
      Color(0xFF3B82F6), // Blue
      Color(0xFF10B981), // Green
      Color(0xFFF59E0B), // Orange
      Color(0xFF8B5CF6), // Purple
      Color(0xFF14B8A6), // Teal
      Color(0xFF6366F1), // Indigo
      Color(0xFFEC4899), // Pink
      Color(0xFF06B6D4), // Cyan
    ];
    return colors[name.hashCode.abs() % colors.length];
  }
}
