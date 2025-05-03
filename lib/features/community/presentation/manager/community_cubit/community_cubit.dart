import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/errors/failure.dart';
import 'package:planty/core/service/api_service.dart';
import 'package:planty/features/community/data/models/post_model.dart';
import 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit() : super(CommunityInitial());

  List<PostModel> posts = [];

  Future<void> fetchPosts() async {
    emit(CommunityLoading());

    try {
      final api = ApiService();
      await api.setTokenFromPrefs();
      final response = await api.get('/api/Post/GetAll');

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<dynamic> content = response.data['content'];
        posts = content.map((e) => PostModel.fromJson(e)).toList();
        emit(CommunitySuccess(posts));
      } else {
        emit(CommunityFailure('Failed to fetch posts'));
      }
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioExeption(dioError);
      emit(CommunityFailure(failure.errorMessage));
    } catch (e) {
      emit(CommunityFailure("Unexpected error occurred"));
    }
  }

  Future<void> deletePost(int postId) async {
    emit(CommunityLoading());
    try {
      final api = ApiService();
      await api.setTokenFromPrefs();

      final response =
          await api.delete('/api/Post', queryParameters: {'Id': postId});

      if (response.statusCode == 200 && response.data['success'] == true) {
        posts.removeWhere((post) => post.id == postId);
        emit(CommunitySuccess(List.from(posts)));
      } else {
        emit(CommunityFailure(
            response.data['content'] ?? 'Failed to delete post'));
      }
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioExeption(dioError);
      emit(CommunityFailure(failure.errorMessage));
    } catch (e) {
      emit(CommunityFailure("Unexpected error occurred"));
    }
  }
}
