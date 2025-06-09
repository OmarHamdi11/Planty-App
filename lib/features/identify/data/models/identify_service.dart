import 'dart:io';
import 'package:dio/dio.dart';
import 'package:planty/features/identify/data/models/identify_model.dart';

class IdentifyService {
  final Dio dio;

  IdentifyService(this.dio);

  Future<IdentifyModel> identifyPlant(File imageFile) async {
    final url = "https://de49-34-74-177-131.ngrok-free.app/predict";

    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imageFile.path),
    });

    final response = await dio.post(url, data: formData);

    return IdentifyModel.fromJson(response.data);
  }
}
