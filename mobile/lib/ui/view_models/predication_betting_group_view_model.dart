import 'package:flutter/material.dart';

class PredicationBettingGroupViewModel extends ChangeNotifier {

  final List<Map<String, dynamic>> predicationsExactScore = [
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
    }
  ];

  final List<Map<String, dynamic>> predicationsMatchResult = [
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


  int selectedTabIndex = 0;

  void setTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }
}