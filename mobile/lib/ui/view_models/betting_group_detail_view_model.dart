import 'package:flutter/material.dart';
import 'package:mobile/services/betting_group_service.dart';
import 'package:mobile/services/match_service.dart';
import 'package:mobile/services/prediction_service.dart';

class BettingGroupDetailViewModel extends ChangeNotifier {
  final BettingGroupService _bettingGroupService = BettingGroupService();
  final MatchService _matchService = MatchService();
  final PredictionService _predictionService = PredictionService();

  // 0 para palpites 1 para ranking
  int selectedTabIndex = 1;

  final List<Map<String, dynamic>> rankingData = [];
  final List<Map<String, dynamic>> predications = [];

  String groupName = "Bolão";
  String creatorName = "Criador";
  final List<String> avatars = [];
  int additionalCount = 0;

  void setTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  Future<void> loadGroupDetails(String code) async {
    print('===> Chamando loadGroupDetails com código $code');
    await loadDetails(code);
    await getGroupRanking(code);
    await loadMatches(code);

    avatars.clear();
    avatars.addAll(rankingData.map((item) => item['imageUrl'] as String).where((url) => url.isNotEmpty).take(4));

    if (rankingData.length > 4) {
      additionalCount = rankingData.length - 4;
    } else {
      additionalCount = 0;
    }

    notifyListeners();
  }

  Future<void> loadMatches(String code) async {
    if (code.isEmpty) return;
    final matches = await _matchService.getCurrentRoundMatches(code);
    
    predications.clear();
    
    for (var match in matches) {
      final localDate = match.matchDate.toLocal();
      final day = localDate.day.toString().padLeft(2, '0');
      final month = localDate.month.toString().padLeft(2, '0');
      final year = localDate.year.toString();
      final timeStr = "$day/$month/$year às ${localDate.hour.toString().padLeft(2, '0')}:${localDate.minute.toString().padLeft(2, '0')}";

      final now = DateTime.now();
      final limitTime = localDate.subtract(const Duration(minutes: 5));
      final isTimeOver = now.isAfter(limitTime);

      // Buscar se existe palpite do tipo EXACT_SCORE
      final exactScorePred = match.predictions.where((p) => p.type.value == 'EXACT_SCORE').firstOrNull;

      predications.add({
        'matchId': match.id,
        'groupCode': code,
        'match': '${match.homeTeam.name} vs. ${match.awayTeam.name}',
        'status': match.status.value,
        'type': 'EXACT_SCORE',
        'homeTeam': match.homeTeam.abbreviatedName,
        'awayTeam': match.awayTeam.abbreviatedName,
        'homeScore': match.homeScore,
        'awayScore': match.awayScore,
        'homeScorePrediction': exactScorePred?.homeScoreGuess,
        'awayScorePrediction': exactScorePred?.awayScoreGuess,
        'resultGuess': exactScorePred?.resultGuess?.value ?? 'NULLED',
        'time': timeStr,
        'isOpined': exactScorePred != null && (exactScorePred.homeScoreGuess != null || exactScorePred.awayScoreGuess != null),
        'isTimeOver': isTimeOver,
      });

      // Buscar se existe palpite do tipo MATCH_RESULT
      final matchResultPred = match.predictions.where((p) => p.type.value == 'MATCH_RESULT').firstOrNull;

      predications.add({
        'matchId': match.id,
        'groupCode': code,
        'match': '${match.homeTeam.name} vs. ${match.awayTeam.name}',
        'status': match.status.value,
        'type': 'MATCH_RESULT',
        'homeTeam': match.homeTeam.abbreviatedName,
        'awayTeam': match.awayTeam.abbreviatedName,
        'homeScore': match.homeScore,
        'awayScore': match.awayScore,
        'homeScorePrediction': matchResultPred?.homeScoreGuess,
        'awayScorePrediction': matchResultPred?.awayScoreGuess,
        'resultGuess': matchResultPred?.resultGuess?.value ?? 'NULLED',
        'time': timeStr,
        'isOpined': matchResultPred != null && matchResultPred.resultGuess != null,
        'isTimeOver': isTimeOver,
      });
    }
    notifyListeners();
  }

  Future<bool> submitPrediction({
    required int matchId,
    required String type,
    int? homeScore,
    int? awayScore,
    String? result,
    required String groupCode,
  }) async {
    final success = await _predictionService.submitPrediction(
      matchId: matchId,
      predicationType: type,
      homeScoreGuess: homeScore,
      awayScoreGuess: awayScore,
      resultGuess: result,
      bettingGroupCode: groupCode,
    );

    if (success) {
      await loadMatches(groupCode);
    }
    return success;
  }


  Future<void> getGroupRanking(String code) async {
    if (code.isEmpty) return;
    final ranking = await _bettingGroupService.getBettingGroupRanking(code);
    // Atualizar o estado com os dados do ranking
    rankingData.clear();
    notifyListeners();

    rankingData.addAll(
      ranking.map((item) {
        return {
          'name': item['user']['name'] ?? 'Usuário',
          'imageUrl': item['user']['image'] ?? '',
          'points': item['score'] ?? 0,
        };
      }).toList(),
    );
    notifyListeners();
  }

  Future<void> loadDetails(String code) async {
    if (code.isEmpty) return;
    final bettingGroupDetail = await _bettingGroupService.getBettingGroupDetails(code);

    groupName = bettingGroupDetail['name'] ?? 'Bolão';  
    creatorName = bettingGroupDetail['creator']['name'] ?? 'Criador';
    
    notifyListeners();
  }

  void shareGroup() {
    // TODO: Implementar lógica de compartilhamento
    print("Compartilhando link do bolão...");
  }
}
