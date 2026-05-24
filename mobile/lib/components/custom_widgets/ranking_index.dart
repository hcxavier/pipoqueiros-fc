import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/constants/styles.dart';

class RankingIndex extends StatelessWidget {
  final int index;

  const RankingIndex(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: index > 2 ? AppColors.bgTertiary : Colors.transparent, // Ouro para 1º, Prata para 2º, Bronze para 3º, cinza para os demais
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: switch (index) {
          0 => SvgPicture.asset('assets/ranking/ouro-1.svg', width: 30, height: 30),
          1 => SvgPicture.asset('assets/ranking/prata-1.svg', width: 30, height: 30),
          2 => SvgPicture.asset('assets/ranking/bronze-1.svg', width: 30, height: 30),
          _ => Text(' ${index + 1}° ', style: AppFonts.captionBold),
        },
      ),
    );
  }
}