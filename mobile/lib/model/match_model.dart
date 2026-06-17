import 'package:mobile/model/predication_model.dart';

class TeamModel {
  final int id;
  final int externalId;
  final String name;
  final String abbreviatedName;
  final String shieldUrl;

  TeamModel({
    required this.id,
    required this.externalId,
    required this.name,
    required this.abbreviatedName,
    required this.shieldUrl,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      id: json['id'] as int,
      externalId: json['externalId'] as int,
      name: json['name'] as String,
      abbreviatedName: json['abbreviatedName'] as String,
      shieldUrl: json['shieldUrl'] as String,
    );
  }
}

class PredictionGuessModel {
  final int id;
  final TypePredicationEnum type;
  final int? homeScoreGuess;
  final int? awayScoreGuess;
  final ResultGuessEnum? resultGuess;

  PredictionGuessModel({
    required this.id,
    required this.type,
    this.homeScoreGuess,
    this.awayScoreGuess,
    this.resultGuess,
  });

  factory PredictionGuessModel.fromJson(Map<String, dynamic> json) {
    return PredictionGuessModel(
      id: json['id'] as int,
      type: TypePredicationEnum.values.firstWhere(
        (e) => e.value == json['type'],
        orElse: () => TypePredicationEnum.nulled,
      ),
      homeScoreGuess: json['homeScoreGuess'] as int?,
      awayScoreGuess: json['awayScoreGuess'] as int?,
      resultGuess: json['resultGuess'] != null
          ? ResultGuessEnum.values.firstWhere(
              (e) => e.value == json['resultGuess'],
              orElse: () => ResultGuessEnum.nulled,
            )
          : null,
    );
  }
}

class MatchModel {
  final int id;
  final int externalId;
  final DateTime matchDate;
  final MatchStatus status;
  final int? homeScore;
  final int? awayScore;
  final TeamModel homeTeam;
  final TeamModel awayTeam;
  final List<PredictionGuessModel> predictions;

  MatchModel({
    required this.id,
    required this.externalId,
    required this.matchDate,
    required this.status,
    this.homeScore,
    this.awayScore,
    required this.homeTeam,
    required this.awayTeam,
    required this.predictions,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      id: json['id'] as int,
      externalId: json['externalId'] as int,
      matchDate: DateTime.parse(json['matchDate'] as String),
      status: MatchStatus.values.firstWhere(
        (e) => e.value == json['status'],
        orElse: () => MatchStatus.upcoming,
      ),
      homeScore: json['homeScore'] as int?,
      awayScore: json['awayScore'] as int?,
      homeTeam: TeamModel.fromJson(json['homeTeam'] as Map<String, dynamic>),
      awayTeam: TeamModel.fromJson(json['awayTeam'] as Map<String, dynamic>),
      predictions: (json['predictions'] as List<dynamic>?)
              ?.map((e) => PredictionGuessModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
