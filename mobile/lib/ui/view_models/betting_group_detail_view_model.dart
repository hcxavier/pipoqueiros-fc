import 'package:flutter/material.dart';
import 'package:mobile/services/betting_group_service.dart';

class BettingGroupDetailViewModel extends ChangeNotifier {
  final BettingGroupService _bettingGroupService = BettingGroupService();

  // 0 para palpites 1 para ranking
  int selectedTabIndex = 1;

  final List<Map<String, dynamic>> rankingData = [];

  final List<Map<String, dynamic>> predications = [
    {
      'match': 'Bahia vs. Vitória',
      'status': 'SCHEDULED',
      'type': 'EXACT_SCORE',
      'homeTeam': 'BAH',
      'awayTeam': 'VIT',
      'homeScore': 2,
      'awayScore': 1,
      'homeScorePrediction': 2,
      'awayScorePrediction': 1,
      'resultGuess': 'NULLED',
      'time': '* 42\'',
      'isOpined': true,
    },
    {
      'match': 'Flamengo vs. Fluminense',
      'status': 'SCHEDULED',
      'type': 'MATCH_RESULT',
      'homeTeam': 'FLA',
      'awayTeam': 'FLU',
      'homeScore': 1,
      'awayScore': 1,
      'homeScorePrediction': null,
      'awayScorePrediction': null,
      'resultGuess': 'HOME_WIN',
      'time': '* 30\'',
      'isOpined': true,
    },
  ];

  String groupName = "Bolão do Rodrigão";
  String creatorName = "Rodrigo G.";
  final List<String> avatars = [
    'https://i.pravatar.cc/150?img=1',
    'https://i.pravatar.cc/150?img=2',
    'https://i.pravatar.cc/150?img=3',
    'https://i.pravatar.cc/150?img=4',
  ];
  int additionalCount = 0;

  void setTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  Future<void> loadGroupDetails(String code) async {
    print('===> Chamando loadGroupDetails com código $code');
    await loadDetails(code);
    await getGroupRanking(code);

    avatars.clear();
    avatars.addAll(rankingData.map((item) => item['imageUrl'] as String).where((url) => url.isNotEmpty).take(4));

    if (rankingData.length > 4) {
      additionalCount = rankingData.length - 4;
    } else {
      additionalCount = 0;
    }

    notifyListeners();
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
