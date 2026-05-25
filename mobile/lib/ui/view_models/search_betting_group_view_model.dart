import 'package:flutter/material.dart';

class SearchBettingGroupViewModel extends ChangeNotifier {
  final TextEditingController codeController = TextEditingController();

  Future<int?> searchGroup(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return null;
    // TODO: Implement search logic
    return 1; // Replace with actual betting group ID
  }
}
