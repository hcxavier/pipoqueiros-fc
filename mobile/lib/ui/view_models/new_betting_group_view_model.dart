import 'package:flutter/material.dart';
import 'package:mobile/services/betting_group_service.dart';
import 'package:mobile/validators/validators.dart';

class NewBettingGroupViewModel extends ChangeNotifier {
  final BettingGroupService _bettingGroupService;

  NewBettingGroupViewModel({BettingGroupService? bettingGroupService})
      : _bettingGroupService = bettingGroupService ?? BettingGroupService();

  // Controllers
  final TextEditingController nameController = TextEditingController();

  // State
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<int?> createGroup() async {
    final validationError = nameBettingGroupValidator(nameController.text);
    if (validationError != null) {
      return null;
    }

    setLoading(true);
    final id = await _bettingGroupService.createBettingGroup(nameController.text);
    setLoading(false);

    return id;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
