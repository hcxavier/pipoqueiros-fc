import 'package:isar/isar.dart';

part 'settings_model.g.dart';

enum UserRoleEnum {
  admin('ADMIN'),
  user('USER');

  final String value;
  const UserRoleEnum(this.value);
}

@collection
class SettingsModel {
  Id id = 0;

  @enumerated
  UserRoleEnum userRole;
  String? themeMode;

  SettingsModel({required this.userRole, this.themeMode});
}
