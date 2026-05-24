import 'package:flutter/material.dart';

class RankingViewModel extends ChangeNotifier {
  // State
  bool isLoading = false;

  final List<Map<String, dynamic>> cityRanking = [
    {'name': 'Rodrigo G.', 'points': 100, 'avatarUrl': 'https://i.pravatar.cc/150?img=1'},
    {'name': 'Maria S.', 'points': 90, 'avatarUrl': 'https://i.pravatar.cc/150?img=2'},
    {'name': 'João P.', 'points': 80, 'avatarUrl': 'https://i.pravatar.cc/150?img=3'},
    {'name': 'Ana L.', 'points': 70, 'avatarUrl': 'https://i.pravatar.cc/150?img=4'},
  ];

  final List<Map<String, dynamic>> stateRanking = [
    {'name': 'Carlos M.', 'points': 100, 'avatarUrl': 'https://i.pravatar.cc/150?img=5'},
    {'name': 'Fernanda R.', 'points': 90, 'avatarUrl': 'https://i.pravatar.cc/150?img=6'},
    {'name': 'Lucas T.', 'points': 80, 'avatarUrl': 'https://i.pravatar.cc/150?img=7'},
    {'name': 'Juliana C.', 'points': 70, 'avatarUrl': 'https://i.pravatar.cc/150?img=8'},
  ];

  final List<Map<String, dynamic>> nationalRanking = [
    {'name': 'André L.', 'points': 100, 'avatarUrl': 'https://i.pravatar.cc/150?img=9'},
    {'name': 'Patrícia S.', 'points': 99, 'avatarUrl': 'https://i.pravatar.cc/150?img=10'},
    {'name': 'Roberto G.', 'points': 95, 'avatarUrl': 'https://i.pravatar.cc/150?img=11'},
    {'name': 'Mariana F.', 'points': 91, 'avatarUrl': 'https://i.pravatar.cc/150?img=12'},
    {'name': 'Carlos M.', 'points': 90, 'avatarUrl': 'https://i.pravatar.cc/150?img=5'},
    {'name': 'Fernanda R.', 'points': 85, 'avatarUrl': 'https://i.pravatar.cc/150?img=6'},
    {'name': 'Lucas T.', 'points': 84, 'avatarUrl': 'https://i.pravatar.cc/150?img=7'},
    {'name': 'Juliana C.', 'points': 83, 'avatarUrl': 'https://i.pravatar.cc/150?img=8'},
    {'name': 'Rodrigo G.', 'points': 82, 'avatarUrl': 'https://i.pravatar.cc/150?img=1'},
    {'name': 'Maria S.', 'points': 81, 'avatarUrl': 'https://i.pravatar.cc/150?img=2'},
    {'name': 'João P.', 'points': 80, 'avatarUrl': 'https://i.pravatar.cc/150?img=3'},
    {'name': 'Ana L.', 'points': 70, 'avatarUrl': 'https://i.pravatar.cc/150?img=4'},
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
    await Future.delayed(const Duration(seconds: 3)); // Simula uma chamada de rede
    setLoading(false);
  }
}