import 'package:flutter/material.dart';

class BettingGroupDetailViewModel extends ChangeNotifier {
  // 0 para palpites 1 para ranking
  int selectedTabIndex = 1;

  final List<Map<String, dynamic>> rankingData = [
    {'name': 'Rodrigo G.', 'points': 100, 'avatarUrl': 'https://i.pravatar.cc/150?img=1'},
    {'name': 'Maria S.', 'points': 90, 'avatarUrl': 'https://i.pravatar.cc/150?img=2'},
    {'name': 'João P.', 'points': 80, 'avatarUrl': 'https://i.pravatar.cc/150?img=3'},
    {'name': 'Ana L.', 'points': 70, 'avatarUrl': 'https://i.pravatar.cc/150?img=4'},
  ];

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

  final String groupName = "Bolão do Rodrigão";
  final String creatorName = "Rodrigo G.";
  final List<String> avatars = [
    'https://i.pravatar.cc/150?img=1',
    'https://i.pravatar.cc/150?img=2',
    'https://i.pravatar.cc/150?img=3',
    'https://i.pravatar.cc/150?img=4',
  ];
  final int additionalCount = 38;

  void setTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  void shareGroup() {
    // TODO: Implementar lógica de compartilhamento
    print("Compartilhando link do bolão...");
  }
}
