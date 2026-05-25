import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/lib/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile/services/api_service.dart';
import 'package:mobile/storages/user_storage.dart';

class AuthService {
  final ApiService _api = ApiService();
  final UserStorage _userStorage = UserStorage();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _api.post(
        '/api/auth/sign-in/email',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        if (response.data['token'] != null) {
          await _userStorage.saveTokens(response.data['token']);
        }

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
    String? locationCity,
    String? locationState,
  ) async {
    try {
      final response = await _api.post(
        '/api/auth/sign-up/email',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'city': locationCity,
          'state': locationState,
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        // As vezes a API retorna 201(Created) ou 200(OK) no registro
        if (response.data['token'] != null) {
          await _userStorage.saveTokens(response.data['token']);
        }

        response.data['success'] = true;
        return response.data;
      }
    } on DioException catch (e) {
      print(e);
      print('Register Falhou - Status: ${e.response?.statusCode}');

      String errorMessage = 'Não foi possível conectar ao servidor.';
      if (e.response != null &&
          e.response?.data != null &&
          e.response?.data is Map) {
        if (e.response?.data['code'] == 'EMAIL_ALREADY_EXISTS') {
          errorMessage = 'Este email já está cadastrado.';
        } else {
          errorMessage =
              e.response?.data['message'] ??
              'Falha ao cadastrar, tente novamente.';
        }
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = 'Servidor indisponível. Tente novamente mais tarde.';
      }

      return {'success': false, 'message': errorMessage};
    } catch (e) {
      print('Register Error: $e');
      return {'success': false, 'message': 'Ocorreu um erro inesperado.'};
    }
    return {'success': false, 'message': 'Houve um problema.'};
  }

  Future<Map<String, dynamic>> getAddressForm() async {
    try {
      Position posicao = await obterLocalizacaoAtual();

      print('Latitude: ${posicao.latitude}, Longitude: ${posicao.longitude}');

      // Supondo que a sua API receba lat e long para devolver a cidade/estado
      final response = await _api.post(
        '/register/address',
        data: {
          'latitude': posicao.latitude.toString(),
          'longitude': posicao.longitude.toString(),
        },
      );

      return {'success': true, 'data': response.data};
    } catch (e) {
      print('Get Address Form Error: $e');
      // "e" contém a string de erro lançada no geolocator ou problema de conexão.
      return {'success': false, 'message': e.toString()};
    }
  }

  Future<bool> googleLogin(String idToken) async {
    try {
      final response = await _api.post(
        '/api/auth/sign-in/social',
        data: {
          'provider': 'google',
          'idToken': {'token': idToken},
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data != null && response.data['token'] != null) {
          await _userStorage.saveTokens(response.data['token']);
        }
        return true;
      } else {
        return false;
      }
    } catch (error) {
      debugPrint('Google Login Error: $error');
    }
    return false;
  }

  Future<Map<String, dynamic>> getSession() async {
    try {
      final response = await _api.get('/api/auth/get-session');

      if (response.statusCode == 200 && response.data != null) {
        // Se a API retonar a sessão validada, salvamos o novo token refrescado
        if (response.data['session'] != null &&
            response.data['session']['token'] != null) {
          await _userStorage.saveTokens(response.data['session']['token']);
        }
        return {'success': true, 'data': response.data};
      }
    } catch (e) {
      print('Get Session Error: $e');
    }
    return {'success': false};
  }

  Future<bool> logout() async {
    try {
      // Tenta invalidar a sessão no backend (ignora erros caso o backend não suporte)
      await _api.post('/api/auth/sign-out');
    } catch (e) {
      print('Logout API Error: $e');
    } finally {
      // É essencial garantir que o token local seja sempre apagado no encerramento
      await _userStorage.deleteTokens();
    }
    return true;
  }
}
