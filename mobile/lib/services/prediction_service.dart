import 'package:dio/dio.dart';
import 'package:mobile/services/api_service.dart';

class PredictionService {
  final ApiService _api;

  PredictionService({ApiService? apiService}) : _api = apiService ?? ApiService();

  Future<bool> submitPrediction({
    required int matchId,
    required String predicationType,
    int? homeScoreGuess,
    int? awayScoreGuess,
    String? resultGuess,
    String? bettingGroupCode,
  }) async {
    try {
      final response = await _api.post('/predications', data: {
        'matchId': matchId,
        'predicationType': predicationType,
        'home_score_guess': homeScoreGuess,
        'away_score_guess': awayScoreGuess,
        'result_guess': resultGuess,
        'bettingGroupCode': bettingGroupCode,
      });
      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException catch (e) {
      print('Erro ao enviar palpite: ${e.message}');
    } catch (e) {
      print('Erro inesperado ao enviar palpite: $e');
    }
    return false;
  }
}
