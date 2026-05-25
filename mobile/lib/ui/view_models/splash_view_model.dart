import 'package:flutter/material.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/storages/user_storage.dart';

class SplashViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final UserStorage _userStorage = UserStorage();

  Future<bool> connect() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await _userStorage.getAccessToken() ?? '';

    if (token.isNotEmpty) {
      // final response = await _authService.refreshToken();

      // if (response['success'] == true) {
      //   return true;
      // }
    }
    return false;
  }
}
