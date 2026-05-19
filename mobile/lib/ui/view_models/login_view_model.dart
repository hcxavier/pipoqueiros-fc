import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  //Services
  final AuthService _authService = AuthService();

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Password visibility toggle
  bool isObscure = true;
  void togglePasswordVisibility() {
    isObscure = !isObscure;
    notifyListeners();
  }

  Future<bool> login(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return false;

    //Retirar depois
    return true;

    final response = await _authService.login(emailController.text, passwordController.text);

    if (response['success'] == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return false;

    final response = await _authService.register(nameController.text, emailController.text, passwordController.text);

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

      await _googleSignIn.initialize(
        serverClientId: serverClientId,
      );

      // ignore: unnecessary_nullable_for_final_variable_declarations
      final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();
      if (googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      if (idToken != null) {
        Map<String, dynamic> response = await http.post(
          Uri.parse('http://192.168.0.109:3333/api/auth/sign-in/social'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'provider': 'google', 'idToken': {'token': idToken}}),
        ).then((res) => res.statusCode == 200 ? {'success': true} : {'success': res.body});

        if (response['success'] == true) {
          return true;
        } else {
          debugPrint('Erro no backend ao validar o token do Google.$response');
          return false;
        }
      }
    } catch (error) {
      debugPrint('Erro ao fazer login com Google: $error');
    }
    return false;
  }
}