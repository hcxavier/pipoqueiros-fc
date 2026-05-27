import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile/constants/styles.dart';
import 'package:mobile/model/settings_model.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/storages/user_storage.dart';

class SettingsViewModel extends ChangeNotifier {
  final UserStorage _userStorage = UserStorage();
  final AuthService _authService = AuthService();
  final ImagePicker _picker = ImagePicker();

  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  bool _isUploading = false;
  bool get isUploading => _isUploading;

  final profile = <String, String>{
    'name': '',
    'imagePath': 'assets/logo/logo_icon.png',
  };

  SettingsViewModel() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settings = await _userStorage.getSettings();
    if (settings != null && settings.themeMode != null) {
      _themeMode = settings.themeMode == 'light' ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
    await _loadProfile();
  }

  Future<void> _loadProfile() async {
    final response = await _authService.getSession();
    if (response['success'] == true && response['data'] != null) {
      final user = response['data']['user'];
      if (user != null) {
        profile['name'] = user['name'] ?? '';
        final img = user['image'];
        if (img != null && img.toString().isNotEmpty) {
          profile['imagePath'] = img.toString();
        } else {
          profile['imagePath'] = '';
        }
        notifyListeners();
      }
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

  Future<void> editProfile(BuildContext context) async {
    if (_isUploading) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgSecondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(LucideIcons.camera, color: AppColors.yellowPrimary),
                title: const Text('Tirar Foto', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(bottomSheetContext);
                  _pickImage(ImageSource.camera, context);
                },
              ),
              ListTile(
                leading: const Icon(LucideIcons.image, color: AppColors.yellowPrimary),
                title: const Text('Escolher da Galeria', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(bottomSheetContext);
                  _pickImage(ImageSource.gallery, context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image == null) return;

      _isUploading = true;
      notifyListeners();

      final result = await _authService.updateProfilePicture(image.path);

      _isUploading = false;
      if (result['success'] == true) {
        await _loadProfile();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Foto de perfil atualizada com sucesso!'),
              backgroundColor: AppColors.greenPrimary,
            ),
          );
        }
      } else {
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result['message'] ?? 'Erro ao atualizar foto de perfil.'),
              backgroundColor: AppColors.textError,
            ),
          );
        }
      }
    } catch (e) {
      _isUploading = false;
      notifyListeners();
      print('Erro ao escolher imagem: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Erro ao selecionar ou enviar imagem.'),
            backgroundColor: AppColors.textError,
          ),
        );
      }
    }
  }

  Future<void> support() async {
    // Implementar lógica de suporte, como abrir um email ou chat
  }

  Future<void> rate() async {
    // Implementar lógica de avaliação, como abrir a loja de aplicativos
  }
}
