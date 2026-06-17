import 'package:dio/dio.dart';
import 'package:mobile/services/api_service.dart';

class BettingGroupService {
  final ApiService _api;

  BettingGroupService({ApiService? apiService})
    : _api = apiService ?? ApiService();

  Future<String?> createBettingGroup(String name) async {
    try {
      final response = await _api.post('/betting-groups', data: {'name': name});
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
      final code = groupData['code'];
      if (code != null) {
        return code.toString();
      }
      final id = groupData['id'];
      if (id != null) {
        return id.toString();
      }
    } on DioException catch (e) {
      print('Erro ao criar bolão: ${e.message}');
    } catch (e) {
      print('Erro inesperado ao criar bolão: $e');
    }
    return null;
  }

  Future<List<dynamic>?> getUserBettingGroups() async {
    try {
      final response = await _api.get('/users/betting-groups');
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

  Future<List<dynamic>> getBettingGroupRanking(String groupCode) async {
    try {
      final response = await _api.get('/betting-groups/$groupCode/ranking');
      if (response.statusCode != 200) {
        return [];
      }
      final data = response.data;
      if (data == null) {
        return [];
      }
      final ranking = data['data'];
      if (ranking is List) {
        return ranking;
      }
    } on DioException catch (e) {
      print('Erro ao buscar ranking do bolão: ${e.message}');
    } catch (e) {
      print('Erro inesperado ao buscar ranking: $e');
    }
    return [];
  }

  Future<dynamic> getBettingGroupDetails(String groupCode) async {
    try {
      final response = await _api.get('/betting-groups/$groupCode');
      if (response.statusCode != 200) {
        return null;
      }
      final data = response.data;
      if (data == null) {
        return null;
      }
      final groupDetails = data['data'];
      return groupDetails;
    } on DioException catch (e) {
      print('Erro ao buscar detalhes do bolão: ${e.message}');
    } catch (e) {
      print('Erro inesperado ao buscar detalhes: $e');
    }
    return null;
  }

  Future<bool> joinBettingGroup(String groupCode) async {
    try {
      final response = await _api.post('/betting-groups/add-user', 
        data: {'bettingGroupCode': groupCode}
      );

      return response.statusCode == 200;
      
    } on DioException catch (e) {
      print('Erro ao entrar no bolão: ${e.message}');
    } catch (e) {
      print('Erro inesperado ao entrar no bolão: $e');
    }
    return false;
  }
}
