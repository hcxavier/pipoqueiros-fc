import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/constants/styles.dart';

enum TypePredicationEnum {
  exact('EXACT_SCORE'),
  result('MATCH_RESULT'),
  nulled('NULLED');

  final String value;
  const TypePredicationEnum(this.value);
}

enum MatchStatus {
  upcoming('SCHEDULED'),
  live('IN_PROGRESS'),
  finished('FINISHED');

  final String value;
  const MatchStatus(this.value);
}

enum ResultGuessEnum {
  homeWin('HOME_WIN'),
  draw('DRAW'),
  awayWin('AWAY_WIN'),
  nulled('NULLED');

  final String value;
  const ResultGuessEnum(this.value);
}

class Predication extends StatelessWidget {
  final String? time;
  final String match;
  final MatchStatus matchStatus;
  final TypePredicationEnum type;
  final String? homeTeam;
  final int? homeScore;
  final int? homeScorePrediction;
  final String? awayTeam;
  final int? awayScore;
  final int? awayScorePrediction;
  final ResultGuessEnum resultGuess;
  final bool isOpined;
  final Widget? opined;
  final VoidCallback? onTap;

  const Predication({
    super.key,
    required this.time,
    required this.match,
    required this.matchStatus,
    required this.type,
    this.homeTeam,
    this.awayTeam,
    this.onTap,
    this.homeScore,
    this.awayScore,
    this.homeScorePrediction,
    this.awayScorePrediction,
    required this.resultGuess,
    this.isOpined = false,
    this.opined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(4),
        border: Border(
          bottom: BorderSide(width: 3, color: matchStatus != MatchStatus.finished ? AppColors.yellowPrimary : getColor(type)),
        ),
      ),
      child: Column(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          time != null ? Text(time!, style: AppFonts.time) : const SizedBox.shrink(),
          Text(match, style: AppFonts.titleSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/teams/${homeTeam ?? 'placeholder'}.png', width: 48, height: 48),
              const SizedBox(width: 12),
              Text('${homeScore ?? ''}', style: AppFonts.titleMedium),
              const SizedBox(width: 12),
              Icon(LucideIcons.x, size: 24, color: AppColors.textMuted),
              const SizedBox(width: 12),
              Text('${awayScore ?? ''}', style: AppFonts.titleMedium),
              const SizedBox(width: 12),
              Image.asset('assets/teams/${awayTeam ?? 'placeholder'}.png', width: 48, height: 48),
            ],
          ),
          Divider(color: AppColors.textMuted, height: 20),
        ],
      ),
    );
  }

  Color getColor(TypePredicationEnum type) {
    if (type == TypePredicationEnum.exact) {
      if (homeScorePrediction == homeScore && awayScorePrediction == awayScore) {
        return AppColors.greenPrimary;
      }
      return AppColors.textError;
    }

    if (homeScore! > awayScore! && resultGuess == ResultGuessEnum.homeWin) {
      return AppColors.greenPrimary;
    }

    if (homeScore! < awayScore! && resultGuess == ResultGuessEnum.awayWin) {
      return AppColors.greenPrimary;
    }

    if (homeScore! == awayScore! && resultGuess == ResultGuessEnum.draw) {
      return AppColors.greenPrimary;
    }

    return AppColors.textError;
  }
}