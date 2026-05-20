import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/storages/local_storage.dart';
import 'package:mobile/app.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage.init();
  await dotenv.load(fileName: '.env');
  
  runApp(const MyApp());
}
