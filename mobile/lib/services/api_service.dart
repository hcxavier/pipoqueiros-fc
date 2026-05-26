import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:mobile/storages/user_storage.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  final String base_url = dotenv.env['API_URL'] ?? '';

  late final Dio _dio;
  final UserStorage _userStorage = UserStorage();

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: base_url,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        // Middleware para injetar headers automáticos (Auth e Idioma)
        onRequest: (options, handler) async {
          // 1. Injeta Token de Autenticação
          final token = await _userStorage.getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );
  }

  // Métodos HTTP atualizados para suportar headers manuais se necessário
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.post(
      path,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.put(
      path,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.delete(
      path,
      data: data,
      options: Options(headers: headers),
    );
  }
}
