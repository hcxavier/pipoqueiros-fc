import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/storages/local_storage.dart';
import 'package:mobile/storages/user_storage.dart';
import 'package:mobile/app.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.android) {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } catch (e) {
      // Ignore
    }
  }

  await LocalStorage.init();
  await dotenv.load(fileName: '.env');

  final userStorage = UserStorage();
  final token = await userStorage.getAccessToken();
  if (token == null) {
    await userStorage.saveTokens('dev-token-xyz');
  }
  
  runApp(const MyApp());
}
