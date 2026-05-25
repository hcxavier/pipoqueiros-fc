import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/services/api_service.dart';

class AuthService {
  final ApiService _api = ApiService();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _api.post(
        '/api/auth/sign-in/email',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        response.data['success'] = true;
        return response.data;
      }
    } on DioException catch (e) {
      // Captura o erro da API para ver o motivo da recusa
      print(e);
      print('Login Falhou - Status: ${e.response?.statusCode}');
      print('Detalhes: ${e.response?.data}');

      String errorMessage = 'Não foi possível conectar ao servidor.';
      if (e.response != null &&
          e.response?.data != null &&
          e.response?.data is Map) {
        if (e.response?.data['code'] == 'INVALID_EMAIL_OR_PASSWORD') {
          errorMessage = "Email ou senha inválidos.";
        } else {
          errorMessage =
              e.response?.data['message'] ??
              'Falha ao autenticar, tente novamente.';
        }
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = 'Servidor indisponível. Tente novamente mais tarde.';
      }

      return {'success': false, 'message': errorMessage};
    } catch (e) {
      print('Login Error: $e');
      return {'success': false, 'message': 'Ocorreu um erro inesperado.'};
    }
    return {'success': false, 'message': 'Houve um problema.'};
  }

  Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await _api.post(
        '/auth/register',
        data: {'name': name, 'email': email, 'password': password},
      );
      if (response.statusCode == 201) {
        response.data['success'] = true;
        return response.data;
      }
    } catch (e) {
      print('Register Error: $e');
    }
    return {'success': false};
  }

  Future<bool> googleLogin(String idToken) async {
    try {
      final response = await _api.post(
        '/auth/sign-in/social',
        data: {
          'provider': 'google',
          'idToken': {'token': idToken},
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      debugPrint('Google Login Error: $error');
    }
    return false;
  }

  Future<bool> logout() async {
    try {
      final response = await _api.post('/auth/logout');
      return response.statusCode == 200;
    } catch (e) {
      print('Logout Error: $e');
      return false;
    }
  }
}
