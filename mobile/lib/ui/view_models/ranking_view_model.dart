import 'package:flutter/material.dart';

class RankingViewModel extends ChangeNotifier {
  // State
  bool isLoading = false;

  int selectedTabIndex = 0;

  void setTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // Metodo de obtenção do ranking
  Future<void> fetchRanking() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 3)); // Simula uma chamada de rede
    setLoading(false);
  }
}