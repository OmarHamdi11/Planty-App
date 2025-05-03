import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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
      await ApiService().setTokenFromPrefs();

      final response = await ApiService().post(
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
    } catch (e) {
      emit(CommentFailure(error: e.toString()));
    }
  }
}
