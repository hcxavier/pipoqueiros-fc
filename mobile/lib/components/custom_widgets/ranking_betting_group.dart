import 'package:flutter/material.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/components/widgets.dart';

class RankingBettingGroup extends StatelessWidget {
  final List<dynamic> rankingData;

  const RankingBettingGroup({super.key, required this.rankingData});

  @override
  Widget build(BuildContext context) {
    return rankingData.isEmpty?
    Center(
      child: Text(
        'O ranking desse bolão ainda não foi\nformado, aguarde os resultados.',
        textAlign: TextAlign.center,
        style: AppFonts.caption,
      ),
    ) :
    ListView.builder(
      itemCount: rankingData.length,
      itemBuilder: (context, index) {
        final item = rankingData[index];
        return BettingGroupParticipantsCard(
          title: item['name'],
          content: '${item['points']} pontos(s)',
          prefix: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(item['avatarUrl']),
          ),
          suffix: RankingIndex(index),
        );
      },
    );
  }
}