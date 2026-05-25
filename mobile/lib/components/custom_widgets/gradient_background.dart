import 'dart:ui';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final double radius;

  const GradientBackground({super.key, required this.color1, required this.color2, required this.radius});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 150,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              color1,
              color2,
            ],
            radius: radius,
            stops: [0.9, 1.0],
            focal: Alignment.center,
          ),
        ),
      ),
    );
  }
}