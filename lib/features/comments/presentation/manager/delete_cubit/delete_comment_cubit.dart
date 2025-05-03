import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:planty/core/errors/failure.dart';
import 'package:planty/core/service/api_service.dart';
import 'delete_comment_state.dart';

class DeleteCommentCubit extends Cubit<DeleteCommentState> {
  DeleteCommentCubit() : super(DeleteCommentInitial());

  Future<void> deleteComment(int commentId) async {
    emit(DeleteCommentLoading());
    try {
      final api = ApiService();
      await api.setTokenFromPrefs();

      final response = await api.delete(
        '/api/Comment',
        queryParameters: {'Id': commentId},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        emit(DeleteCommentSuccess(response.data['content']));
      } else {
        emit(DeleteCommentFailure(
            response.data['content'] ?? "Failed to delete comment"));
      }
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioExeption(dioError);
      emit(DeleteCommentFailure(failure.errorMessage));
    } catch (_) {
      emit(DeleteCommentFailure("Unexpected error occurred"));
    }
  }
}
