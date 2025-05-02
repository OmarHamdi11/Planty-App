import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadProfilePictureService {
  final Dio _dio = Dio();

  Future<String> uploadProfilePicture(File imageFile) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path),
    });

    final response = await _dio.post(
      'http://planty.runasp.net/api/profile/profile-picture',
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    return "http://planty.runasp.net${response.data['imageUrl']}";
  }
}
