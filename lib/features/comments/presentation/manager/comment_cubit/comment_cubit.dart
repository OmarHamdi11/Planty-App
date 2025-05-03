import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:planty/core/errors/failure.dart';
import 'package:planty/core/service/api_service.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  Future<void> addComment({
    required int postId,
    required String content,
  }) async {
    emit(CommentLoading());

    try {
      final api = ApiService();
      await api.setTokenFromPrefs();

      final response = await api.post(
        '/api/comment',
        data: {
          'postId': postId,
          'content': content,
        },
      );

      if (response.statusCode == 200) {
        emit(CommentSuccess());
      } else {
        emit(
            CommentFailure(error: response.data['content'] ?? 'Unknown error'));
      }
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioExeption(dioError);
      emit(CommentFailure(error: failure.errorMessage));
    } catch (e) {
      emit(CommentFailure(error: "Unexpected error occurred"));
    }
  }
}
