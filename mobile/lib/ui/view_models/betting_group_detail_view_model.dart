import 'package:flutter/material.dart';

class BettingGroupDetailViewModel extends ChangeNotifier {
  // 0 para palpites 1 para ranking
  int selectedTabIndex = 1;

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
