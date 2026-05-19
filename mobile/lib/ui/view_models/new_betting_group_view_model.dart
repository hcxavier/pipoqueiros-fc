import 'package:flutter/material.dart';

class NewBettingGroupViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();

  Future<bool> createGroup(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return false;

    // TODO: Implement group creation logic
    return true;
  }
}
