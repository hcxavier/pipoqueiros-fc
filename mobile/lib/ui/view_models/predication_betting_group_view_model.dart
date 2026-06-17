import 'package:flutter/material.dart';

class PredicationBettingGroupViewModel extends ChangeNotifier {
  int selectedTabIndex = 0;

  void setTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }
}