import 'package:flutter/material.dart';
import 'package:mobile/model/settings_model.dart';
import 'package:mobile/storages/user_storage.dart';

class SettingsViewModel extends ChangeNotifier {
  final UserStorage _userStorage = UserStorage();
  
  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  SettingsViewModel() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settings = await _userStorage.getSettings();
    if (settings != null && settings.themeMode != null) {
      _themeMode = settings.themeMode == 'light' ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
  }

  Future<void> toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    var settings = await _userStorage.getSettings();
    if (settings == null) {
      settings = SettingsModel(userRole: UserRoleEnum.user, themeMode: isDark ? 'dark' : 'light');
    } else {
      settings.themeMode = isDark ? 'dark' : 'light';
    }
    await _userStorage.saveSettings(settings);
  }
}
