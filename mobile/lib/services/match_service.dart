import 'package:dio/dio.dart';
import 'package:mobile/model/match_model.dart';
import 'package:mobile/services/api_service.dart';

class MatchService {
  final ApiService _api;

  MatchService({ApiService? apiService})
    : _api = apiService ?? ApiService();

  Future<List<MatchModel>> getCurrentRoundMatches(String groupCode) async {
    try {
      final response = await _api.get('/matches/current/$groupCode');
      
      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null && data['data'] != null) {
          final matchesList = data['data'] as List<dynamic>;
          return matchesList
              .map((json) => MatchModel.fromJson(json as Map<String, dynamic>))
              .toList();
        }
      }
    } on DioException catch (e) {
      print('Erro ao buscar partidas da rodada: ${e.message}');
    } catch (e) {
      print('Erro inesperado ao buscar partidas: $e');
    }
    
    return [];
  }
}
