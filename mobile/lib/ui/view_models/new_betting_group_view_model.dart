import 'package:flutter/material.dart';

class NewBettingGroupViewModel extends ChangeNotifier {

  // Controllers
  final TextEditingController nameController = TextEditingController();

  // State
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // Metodo de criação do bolão
  Future<int?> createGroup(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return null;

    setLoading(true);
    await Future.delayed(const Duration(seconds: 3)); // Simula uma chamada de rede
    setLoading(false);

    // TODO: Implement group creation logic
    return 1;
  }
}
