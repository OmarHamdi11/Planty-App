// lib/features/community/logic/cubit/create_post_cubit.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/errors/failure.dart';
import 'package:planty/core/service/upload_post_service.dart';
import 'package:planty/features/community/presentation/manager/post_cubit/post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final UploadPostService apiService;

  CreatePostCubit(this.apiService) : super(CreatePostInitial());

  Future<void> createPost({
    required String content,
    File? imageFile,
  }) async {
    emit(CreatePostLoading());

    try {
      final result = await apiService.createPost(
        content: content,
        file: imageFile,
      );

      if (result['success'] == true) {
        emit(CreatePostSuccess(result['content']));
      } else {
        emit(CreatePostFailure('Failed to create post.'));
      }
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioExeption(dioError);
      emit(CreatePostFailure(failure.errorMessage));
    } catch (e) {
      emit(CreatePostFailure("Unexpected error occurred"));
    }
  }
}
