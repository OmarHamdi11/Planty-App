import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio;

  ApiService._internal()
      : _dio = Dio(
          BaseOptions(
            baseUrl: "http://planty.runasp.net",
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  // GET
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  // POST
  Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }

  // PUT
  Future<Response> put(String path, {dynamic data}) async {
    return await _dio.put(path, data: data);
  }

  // DELETE
  Future<Response> delete(String path,
      {dynamic data, required Map<String, int> queryParameters}) async {
    return await _dio.delete(path,
        data: data, queryParameters: queryParameters);
  }

  // Set Authorization Token
  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<void> setTokenFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  // Clear Authorization Token
  void clearToken() {
    _dio.options.headers.remove('Authorization');
  }
}
