import 'package:flutter/material.dart';
import 'package:mobile/components/widgets.dart';
import 'package:mobile/constants/styles.dart';

class PredicationBettingGroup extends StatelessWidget {
  final List<dynamic> predications;

  const PredicationBettingGroup({super.key, required this.predications});

  @override
  Widget build(BuildContext context) {
    return predications.isEmpty ?
    Center(
      child: Text(
        'Você ainda não deu\nnenhum palpite.',
        textAlign: TextAlign.center,
        style: AppFonts.caption,
      ),
    )
    : ListView.builder(
      itemCount: predications.length,
      itemBuilder: (context, index) {
        final prediction = predications[index];
        return Predication(
          time: prediction['time'],
          match: prediction['match'],
          matchStatus: MatchStatus.values.firstWhere((e) => e.value == prediction['status']),
          type: TypePredicationEnum.values.firstWhere((e) => e.value == prediction['type']),
          homeTeam: prediction['homeTeam'],
          awayTeam: prediction['awayTeam'],
          homeScore: prediction['homeScore'],
          awayScore: prediction['awayScore'],
          homeScorePrediction: prediction['homeScorePrediction'],
          awayScorePrediction: prediction['awayScorePrediction'],
          resultGuess: ResultGuessEnum.values.firstWhere((e) => e.value == prediction['resultGuess']),
        );
      },
    );
  }
}