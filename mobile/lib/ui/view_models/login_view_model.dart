import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class LoginViewModel {
  
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

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

      final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();
      if (googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
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