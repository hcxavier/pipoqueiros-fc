import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class RankingBettingGroup extends StatelessWidget {
  const RankingBettingGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'O ranking desse bolão ainda não foi\nformado, aguarde os resultados.',
        textAlign: TextAlign.center,
        style: AppFonts.caption,
      ),
    );
  }
}
