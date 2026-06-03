import 'package:flutter/material.dart';
import 'package:mobile/services/ranking_service.dart';

class RankingViewModel extends ChangeNotifier {
  final RankingService _rankingService = RankingService();

  // State
  bool isLoading = false;
  int selectedTabIndex = 0;

  final List<Map<String, dynamic>> cityRanking = [];
  final List<Map<String, dynamic>> stateRanking = [];
  final List<Map<String, dynamic>> nationalRanking = [];

  // Flags para controle de requisições já feitas
  bool _hasFetchedCity = false;
  bool _hasFetchedState = false;
  bool _hasFetchedNational = false;

  void setTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
    fetchRankingForTab(index);
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> fetchRankingForTab(int index) async {
    if (index == 0 && !_hasFetchedCity) {
      setLoading(true);
      final data = await _rankingService.getCityRanking();
      _populateList(data, cityRanking);
      _hasFetchedCity = true;
      setLoading(false);
    } else if (index == 1 && !_hasFetchedState) {
      setLoading(true);
      final data = await _rankingService.getStateRanking();
      _populateList(data, stateRanking);
      _hasFetchedState = true;
      setLoading(false);
    } else if (index == 2 && !_hasFetchedNational) {
      setLoading(true);
      final data = await _rankingService.getNationalRanking();
      _populateList(data, nationalRanking);
      _hasFetchedNational = true;
      setLoading(false);
    }
  }

  void _populateList(List<dynamic> source, List<Map<String, dynamic>> target) {
    target.clear();
    target.addAll(
      source.map((item) {
        return {
          'name': item['name'] ?? 'Usuário',
          'imageUrl': item['image'] ?? '',
          'points': item['totalScore'] ?? 0,
        };
      }).toList(),
    );
  }
}
