import 'package:mobile/services/api_service.dart';

class RankingService {
  final ApiService _api = ApiService();

  Future<List<dynamic>> getCityRanking() async {
    try {
      final response = await _api.get('/ranking/city/');
      final data = response.data;
      if (data != null && data['code'] == 200) {
        final ranking = data['data'];
        if (ranking is List) {
          return ranking;
        }
      }
      return [];
    } catch (e) {
      print('Erro ao buscar city ranking: $e');
      return [];
    }
  }

  Future<List<dynamic>> getStateRanking() async {
    try {
      final response = await _api.get('/ranking/state/');
      final data = response.data;
      if (data != null && data['code'] == 200) {
        final ranking = data['data'];
        if (ranking is List) {
          return ranking;
        }
      }
      return [];
    } catch (e) {
      print('Erro ao buscar state ranking: $e');
      return [];
    }
  }
}
