import 'package:flutter/material.dart';

class PredicationBettingGroupViewModel extends ChangeNotifier {
  final List<Map<String, dynamic>> predicationsExactScore = [];
  final List<Map<String, dynamic>> predicationsMatchResult = [];

  int selectedTabIndex = 0;

  PredicationBettingGroupViewModel(List<Map<String, dynamic>> predications) {
    for (var p in predications) {
      if (p['type'] == 'EXACT_SCORE') {
        predicationsExactScore.add(p);
      } else if (p['type'] == 'MATCH_RESULT') {
        predicationsMatchResult.add(p);
      }
    }
  }

  void setTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }
}