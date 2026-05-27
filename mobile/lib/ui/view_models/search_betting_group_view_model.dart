import 'package:flutter/material.dart';
import 'package:mobile/services/betting_group_service.dart';

class SearchBettingGroupViewModel extends ChangeNotifier {
  final BettingGroupService _bettingGroupService = BettingGroupService();

  final TextEditingController codeController = TextEditingController();

  Future<bool?> searchGroup(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return null;
    
    return await _bettingGroupService.joinBettingGroup(codeController.text.trim().toUpperCase());
  }
}
