import 'package:isar/isar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  
  late final Isar _isar;
  late final FlutterSecureStorage _secureStorage;

  LocalStorage._internal() {
    _secureStorage = const FlutterSecureStorage();
  }

  factory LocalStorage() {
    return _instance;
  }

  Future<void> initialize(Isar isar) async {
    _isar = isar;
  }

  Isar get isar => _isar;
  
  FlutterSecureStorage get secureStorage => _secureStorage;
}
