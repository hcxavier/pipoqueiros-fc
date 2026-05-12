import 'package:isar/isar.dart';

part 'predication_model.g.dart';

enum TypePredicationEnum {
  exact('EXACT_SCORE'),
  result('MATCH_RESULT'),
  nulled('NULLED');

  final String value;
  const TypePredicationEnum(this.value);
}

enum ResultGuessEnum {
  homeWin('HOME_WIN'),
  draw('DRAW'),
  awayWin('AWAY_WIN'),
  nulled('NULLED');

  final String value;
  const ResultGuessEnum(this.value);
}

enum MatchStatus {
  upcoming('SCHEDULED'),
  live('IN_PROGRESS'),
  finished('FINISHED');

  final String value;
  const MatchStatus(this.value);
}

@embedded
class PredicationModel {
  String? homeName;
  String? homeTeamAbbreviation;
  String? awayName;
  String? awayTeamAbbreviation;
  int? homeScore;
  int? awayScore;
  int? homeScorePrediction;
  int? awayScorePrediction;

  @enumerated
  TypePredicationEnum type;

  @enumerated
  ResultGuessEnum resultGuess;
  DateTime? matchDate;

  @enumerated
  MatchStatus matchStatus;

  PredicationModel({
    this.homeName,
    this.homeTeamAbbreviation,
    this.awayName,
    this.awayTeamAbbreviation,
    this.homeScore,
    this.awayScore,
    this.homeScorePrediction,
    this.awayScorePrediction,
    this.type = TypePredicationEnum.nulled,
    this.resultGuess = ResultGuessEnum.nulled,
    this.matchDate,
    this.matchStatus = MatchStatus.upcoming,
  });

  factory PredicationModel.fromJson(Map<String, dynamic> json) {
    return PredicationModel(
      homeName: json['homeName'] as String?,
      homeTeamAbbreviation: json['homeTeamAbbreviation'] as String,
      awayName: json['awayName'] as String,
      awayTeamAbbreviation: json['awayTeamAbbreviation'] as String,
      homeScore: json['homeScore'] as int,
      awayScore: json['awayScore'] as int,
      homeScorePrediction: json['homeScorePrediction'] as int,
      awayScorePrediction: json['awayScorePrediction'] as int,
      type: TypePredicationEnum.values.firstWhere(
        (e) => e.value == json['type'] || e.name == json['type'],
      ),
      resultGuess: json['resultGuess'] != null
          ? ResultGuessEnum.values.firstWhere(
              (e) =>
                  e.value == json['resultGuess'] ||
                  e.name == json['resultGuess'],
            )
          : ResultGuessEnum.nulled,
      matchDate: DateTime.parse(json['matchDate'] as String),
      matchStatus: MatchStatus.values.firstWhere(
        (e) => e.value == json['matchStatus'] || e.name == json['matchStatus'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'homeName': homeName,
      'homeTeamAbbreviation': homeTeamAbbreviation,
      'awayName': awayName,
      'awayTeamAbbreviation': awayTeamAbbreviation,
      'homeScore': homeScore,
      'awayScore': awayScore,
      'homeScorePrediction': homeScorePrediction,
      'awayScorePrediction': awayScorePrediction,
      'type': type.value,
      'resultGuess': resultGuess.value,
      'matchDate': matchDate?.toIso8601String(),
      'matchStatus': matchStatus.value,
    };
  }
}
