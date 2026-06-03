import 'package:flutter/material.dart';
import 'package:mobile/services/ranking_service.dart';

class RankingViewModel extends ChangeNotifier {
  final RankingService _rankingService = RankingService();

  // State
  bool isLoading = false;

  final List<Map<String, dynamic>> cityRanking = [];

  final List<Map<String, dynamic>> stateRanking = [];

  final List<Map<String, dynamic>> nationalRanking = [];

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
    
    // Buscar cidade, estado e nacional concorrentemente
    final results = await Future.wait([
      _rankingService.getCityRanking(),
      _rankingService.getStateRanking(),
      _rankingService.getNationalRanking(),
    ]);

    final cityData = results[0];
    final stateData = results[1];
    final nationalData = results[2];
    
    cityRanking.clear();
    cityRanking.addAll(
      cityData.map((item) {
        return {
          'name': item['name'] ?? 'Usuário',
          'imageUrl': item['image'] ?? '',
          'points': item['totalScore'] ?? 0,
        };
      }).toList(),
    );

    stateRanking.clear();
    stateRanking.addAll(
      stateData.map((item) {
        return {
          'name': item['name'] ?? 'Usuário',
          'imageUrl': item['image'] ?? '',
          'points': item['totalScore'] ?? 0,
        };
      }).toList(),
    );

    nationalRanking.clear();
    nationalRanking.addAll(
      nationalData.map((item) {
        return {
          'name': item['name'] ?? 'Usuário',
          'imageUrl': item['image'] ?? '',
          'points': item['totalScore'] ?? 0,
        };
      }).toList(),
    );

    setLoading(false);
  }
}
