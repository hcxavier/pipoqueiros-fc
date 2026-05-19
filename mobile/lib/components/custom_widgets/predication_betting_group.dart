import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';

class PredicationBettingGroup extends StatelessWidget {
  const PredicationBettingGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Você ainda não deu\nnenhum palpite.',
        textAlign: TextAlign.center,
        style: AppFonts.caption,
      ),
    );
  }
}
