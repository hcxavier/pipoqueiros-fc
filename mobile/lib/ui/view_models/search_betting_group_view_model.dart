import 'package:flutter/material.dart';

class SearchBettingGroupViewModel extends ChangeNotifier {
  final TextEditingController codeController = TextEditingController();

  Future<bool> searchGroup(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return false;
    // TODO: Implement search logic
    return true;
  }
}
