import 'package:dio/dio.dart';
import 'package:mobile/services/api_service.dart';

class BettingGroupService {
  final ApiService _api;

  BettingGroupService({ApiService? apiService}) : _api = apiService ?? ApiService();

  Future<int?> createBettingGroup(String name) async {
    try {
      final response = await _api.post(
        '/betting-groups',
        data: {'name': name},
      );
      if (response.statusCode != 201) {
        return null;
      }
      final data = response.data;
      if (data == null) {
        return null;
      }
      final groupData = data['data'];
      if (groupData == null) {
        return null;
      }
      final id = groupData['id'];
      if (id is int) {
        return id;
      }
    } on DioException catch (e) {
      print('Erro ao criar bolão: ${e.message}');
    } catch (e) {
      print('Erro inesperado ao criar bolão: $e');
    }
    return null;
  }

  Future<List<dynamic>?> getUserBettingGroups(String userId) async {
    try {
      final response = await _api.get('/users/$userId/betting-groups');
      if (response.statusCode != 200) {
        return null;
      }
      final data = response.data;
      if (data == null) {
        return null;
      }
      final groups = data['data'];
      if (groups is List) {
        return groups;
      }
    } on DioException catch (e) {
      print('Erro ao buscar bolões do usuário: ${e.message}');
    } catch (e) {
      print('Erro inesperado ao buscar bolões: $e');
    }
    return null;
  }
}

