import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/errors/failure.dart';
import 'package:planty/core/service/api_service.dart';
import 'package:planty/features/community/presentation/manager/delete_post_cubit/delete_post_state.dart';

class DeletePostCubit extends Cubit<DeletePostState> {
  DeletePostCubit() : super(DeletePostInitial());

  Future<void> deletePost(int postId) async {
    emit(DeletePostLoading());
    try {
      final api = ApiService();
      await api.setTokenFromPrefs();

      final response = await api.delete(
        '/api/Post',
        queryParameters: {'Id': postId},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        emit(DeletePostSuccess());
      } else {
        final errorMsg = response.data?['content'] ?? 'Failed to delete post';
        emit(DeletePostFailure(errorMsg));
      }
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioExeption(dioError);
      emit(DeletePostFailure(failure.errorMessage));
    } catch (e) {
      emit(DeletePostFailure("Unexpected error occurred"));
    }
  }
}
