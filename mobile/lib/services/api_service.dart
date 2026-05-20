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
    _dio = Dio(BaseOptions(
      baseUrl: base_url,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      // Middleware para injetar headers automáticos (Auth e Idioma)
      onRequest: (options, handler) async {
        // 1. Injeta Token de Autenticação
        final token = await _userStorage.getAccessToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        return handler.next(options);
      },

      // Middleware para tratar erro de autenticação (RefreshToken automático)
      onError: (DioException e, handler) async {
        // Ignora rotas de login e registro, onde o 401 significa apenas "credenciais inválidas"
        final isAuthRoute = e.requestOptions.path.contains('/auth/login') || e.requestOptions.path.contains('/auth/register');

        if (e.response?.statusCode == 401 && !isAuthRoute) {
          final success = await _handleTokenRefresh();
          
          if (success) {
            // Se o refresh deu certo, repete a requisição com o novo token
            return handler.resolve(await _retry(e.requestOptions));
          }
        }
        return handler.next(e); // Repassa o erro de login para o AuthService tratar
      },
    ));
  }

  // Tenta renovar o token
  Future<bool> _handleTokenRefresh() async {
    final refreshToken = await _userStorage.getRefreshToken();
    if (refreshToken == null) return false;

    try {
      final response = await Dio().post(
        '$base_url/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];
        
        await _userStorage.saveTokens(newAccessToken, newRefreshToken);
        return true;
      }
    } catch (e) {
      // Se falhar o refresh, desloga o usuário (ex: refresh token expirou)
      await _userStorage.deleteTokens();
      return false;
    }
    return false;
  }

  Future<bool> refresh(){
    return _handleTokenRefresh();
  }

  // Repete a requisição que falhou
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  // Métodos HTTP atualizados para suportar headers manuais se necessário
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    return await _dio.get(path, queryParameters: queryParameters, options: Options(headers: headers));
  }

  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? headers}) async {
    return await _dio.post(path, data: data, options: Options(headers: headers));
  }

  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? headers}) async {
    return await _dio.put(path, data: data, options: Options(headers: headers));
  }

  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? headers}) async {
    return await _dio.delete(path, data: data, options: Options(headers: headers));
  }
}