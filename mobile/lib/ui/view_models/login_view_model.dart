import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final AuthService _authService = AuthService();

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController locationController = TextEditingController();

  // Passwords visibility toggle
  bool isObscure = true;
  bool isObscureConfirmation = true;

  void togglePasswordVisibility() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isObscureConfirmation = !isObscureConfirmation;
    notifyListeners();
  }

  // Métodos de autenticação
  Future<bool> login(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return false;

    //Retirar depois
    return true;

    final response = await _authService.login(
      emailController.text,
      passwordController.text,
    );

    if (response['success'] == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return false;

    //Remover depois
    return true;

    final response = await _authService.register(
      nameController.text,
      emailController.text,
      passwordController.text,
    );

    if (response['success'] == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> googleLogin() async {
    try {
      // O serverClientId (ID Web) para que o Android gere o idToken corretamente.
      final String? serverClientId = dotenv.env['GOOGLE_SERVER_CLIENT_ID'];
      if (serverClientId == null || serverClientId.isEmpty) {
        debugPrint('GOOGLE_SERVER_CLIENT_ID nao definido no .env');
        return false;
      }

      await _googleSignIn.initialize(serverClientId: serverClientId);

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final GoogleSignInAccount? googleUser = await _googleSignIn
          .authenticate();
      if (googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      if (idToken != null) {
        return await _authService.googleLogin(idToken);
      }
    } catch (error) {
      debugPrint('Erro ao fazer login com Google: $error');
    }
    return false;
  }

  Future<List<String>?> getLocation() async {
    // try {
    //   final response = await http.get(Uri.parse('https://ipapi.co/json/'));
    //   if (response.statusCode == 200) {
    //     final data = jsonDecode(response.body);
    //     String city = data['city'] ?? 'Desconhecida';
    //     String region = data['region'] ?? 'Desconhecida';
    //     return [region, city];
    //   } else {
    //     debugPrint('Erro ao obter localização: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   debugPrint('Erro ao obter localização: $e');
    // }
    locationController.text = 'GBI, BA';
    return ['GBI', 'BA'];
  }

  Future<bool> logout() async {
    try {
      await _googleSignIn.signOut();
      return true;
    } catch (error) {
      debugPrint('Erro ao fazer logout: $error');
      return false;
    }
  }
}
