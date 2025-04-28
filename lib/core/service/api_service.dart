import 'package:dio/dio.dart';

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
  Future<Response> delete(String path, {dynamic data}) async {
    return await _dio.delete(path, data: data);
  }

  // Set Authorization Token
  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Clear Authorization Token
  void clearToken() {
    _dio.options.headers.remove('Authorization');
  }
}










//import 'package:dio/dio.dart';
// import 'package:planty/core/service/api_endpoints.dart';

// class ApiService {
//   late final Dio _dio;
//   static final ApiService _instance = ApiService._internal();

//   factory ApiService() => _instance;

//   ApiService._internal() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: ApiEndpoints.baseURL, // <--- Change this
//         connectTimeout: const Duration(seconds: 10),
//         receiveTimeout: const Duration(seconds: 10),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       ),
//     );

//     _dio.interceptors.addAll([
//       _loggingInterceptor(),
//       _errorInterceptor(),
//       // You can add more interceptors here (like refresh token)
//     ]);
//   }

//   // Logging Interceptor
//   Interceptor _loggingInterceptor() {
//     return InterceptorsWrapper(
//       onRequest: (options, handler) {
//         print('➡️ REQUEST [${options.method}] => PATH: ${options.path}');
//         print('Headers: ${options.headers}');
//         print('Data: ${options.data}');
//         return handler.next(options);
//       },
//       onResponse: (response, handler) {
//         print(
//             '✅ RESPONSE [${response.statusCode}] => PATH: ${response.requestOptions.path}');
//         return handler.next(response);
//       },
//       onError: (error, handler) {
//         print(
//             '❌ ERROR [${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');
//         print('Message: ${error.message}');
//         return handler.next(error);
//       },
//     );
//   }

//   // Error handling Interceptor (optional customization)
//   Interceptor _errorInterceptor() {
//     return InterceptorsWrapper(
//       onError: (DioException error, handler) {
//         if (error.response?.statusCode == 401) {
//           // Token expired - handle refresh token here if you want
//           print('⚠️ Unauthorized! Token might be expired.');
//           // Example: await _refreshToken();
//         }
//         return handler.next(error);
//       },
//     );
//   }

//   // Set Authorization Token
//   void setToken(String token) {
//     _dio.options.headers['Authorization'] = 'Bearer $token';
//   }

//   // Clear Authorization Token
//   void clearToken() {
//     _dio.options.headers.remove('Authorization');
//   }

//   // GET
//   Future<Response> get(String path,
//       {Map<String, dynamic>? queryParameters}) async {
//     try {
//       final response = await _dio.get(path, queryParameters: queryParameters);
//       return response;
//     } on DioException catch (e) {
//       throw Exception(_handleError(e));
//     }
//   }

//   // POST
//   Future<Response> post(String path, {dynamic data}) async {
//     try {
//       final response = await _dio.post(path, data: data);
//       return response;
//     } on DioException catch (e) {
//       throw Exception(_handleError(e));
//     }
//   }

//   // PUT
//   Future<Response> put(String path, {dynamic data}) async {
//     try {
//       final response = await _dio.put(path, data: data);
//       return response;
//     } on DioException catch (e) {
//       throw Exception(_handleError(e));
//     }
//   }

//   // DELETE
//   Future<Response> delete(String path, {dynamic data}) async {
//     try {
//       final response = await _dio.delete(path, data: data);
//       return response;
//     } on DioException catch (e) {
//       throw Exception(_handleError(e));
//     }
//   }

//   // Private: Error handling
//   String _handleError(DioException error) {
//     if (error.type == DioExceptionType.connectionTimeout) {
//       return 'Connection Timeout';
//     } else if (error.type == DioExceptionType.receiveTimeout) {
//       return 'Receive Timeout';
//     } else if (error.type == DioExceptionType.badResponse) {
//       return 'Invalid status code: ${error.response?.statusCode}';
//     } else if (error.type == DioExceptionType.unknown) {
//       return 'Unexpected error occurred';
//     } else {
//       return 'Something went wrong';
//     }
//   }
// }
