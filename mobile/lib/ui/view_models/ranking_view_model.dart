import 'package:flutter/material.dart';
import 'package:mobile/services/ranking_service.dart';

class RankingViewModel extends ChangeNotifier {
  final RankingService _rankingService = RankingService();

  // State
  bool isLoading = false;

  final List<Map<String, dynamic>> cityRanking = [];

  final List<Map<String, dynamic>> stateRanking = [
    {'name': 'Carlos M.', 'points': 100, 'imageUrl': 'https://i.pravatar.cc/150?img=5'},
    {'name': 'Fernanda R.', 'points': 90, 'imageUrl': 'https://i.pravatar.cc/150?img=6'},
    {'name': 'Lucas T.', 'points': 80, 'imageUrl': 'https://i.pravatar.cc/150?img=7'},
    {'name': 'Juliana C.', 'points': 70, 'imageUrl': 'https://i.pravatar.cc/150?img=8'},
  ];

  final List<Map<String, dynamic>> nationalRanking = [
    {'name': 'André L.', 'points': 100, 'imageUrl': 'https://i.pravatar.cc/150?img=9'},
    {'name': 'Patrícia S.', 'points': 99, 'imageUrl': 'https://i.pravatar.cc/150?img=10'},
    {'name': 'Roberto G.', 'points': 95, 'imageUrl': 'https://i.pravatar.cc/150?img=11'},
    {'name': 'Mariana F.', 'points': 91, 'imageUrl': 'https://i.pravatar.cc/150?img=12'},
    {'name': 'Carlos M.', 'points': 90, 'imageUrl': 'https://i.pravatar.cc/150?img=5'},
    {'name': 'Fernanda R.', 'points': 85, 'imageUrl': 'https://i.pravatar.cc/150?img=6'},
    {'name': 'Lucas T.', 'points': 84, 'imageUrl': 'https://i.pravatar.cc/150?img=7'},
    {'name': 'Juliana C.', 'points': 83, 'imageUrl': 'https://i.pravatar.cc/150?img=8'},
    {'name': 'Rodrigo G.', 'points': 82, 'imageUrl': 'https://i.pravatar.cc/150?img=1'},
    {'name': 'Maria S.', 'points': 81, 'imageUrl': 'https://i.pravatar.cc/150?img=2'},
    {'name': 'João P.', 'points': 80, 'imageUrl': 'https://i.pravatar.cc/150?img=3'},
    {'name': 'Ana L.', 'points': 70, 'imageUrl': 'https://i.pravatar.cc/150?img=4'},
  ];

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
    
    // Buscar apenas o ranking da cidade por enquanto
    final cityData = await _rankingService.getCityRanking();
    
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

    setLoading(false);
  }
}
