import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconsHome extends StatelessWidget {
  const IconsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/logo/logo.svg', width: 55, height: 55),
        const SizedBox(width: 16),
        Container(height: 55, width: 1.5, color: Colors.white),
        const SizedBox(width: 16),
        SvgPicture.asset('assets/brasileirao_logo.svg', width: 55, height: 55),
      ],
    );
  }
}
