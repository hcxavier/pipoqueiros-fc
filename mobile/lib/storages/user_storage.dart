import 'local_storage.dart';
import '../model/settings_model.dart';

class UserStorage {
  final _localStorage = LocalStorage();

  // Secure Storage (Tokens)
  Future<void> saveTokens(String accessToken) async {
    await _localStorage.writeSecure('access_token', accessToken);
  }

  Future<String?> getAccessToken() async {
    return await _localStorage.readSecure('access_token');
  }

  Future<void> deleteTokens() async {
    await _localStorage.deleteSecure('access_token');
  }

  // Isar Storage (Configurações)
  Future<void> saveSettings(SettingsModel settings) async {
    await _localStorage.writeTxn(() async {
      await _localStorage.isar.settingsModels.put(settings);
    });
  }

  Future<SettingsModel?> getSettings() async {
    final settings = await _localStorage.isar.settingsModels.get(0);
    return settings;
  }
}
