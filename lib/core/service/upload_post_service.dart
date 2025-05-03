// lib/core/services/api_service.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadPostService {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> createPost({
    required String content,
    File? file,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception("Token not found. Please login again.");
    }

    const String url = 'http://planty.runasp.net/api/Post';

    final Map<String, dynamic> formDataMap = {
      'content': content,
    };

    if (file != null) {
      formDataMap['file'] = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
    }

    try {
      final formData = FormData.fromMap(formDataMap);

      final response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      return response.data;
    } catch (e) {
      throw Exception('Failed to create post: $e');
    }
  }
}
