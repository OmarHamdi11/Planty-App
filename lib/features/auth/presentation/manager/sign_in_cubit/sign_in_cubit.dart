import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:planty/core/errors/failure.dart';
import 'package:planty/core/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());

    try {
      final response = await ApiService().post(
        '/api/Account/Login',
        data: {
          "email": email,
          "password": password,
        },
      );

      final data = response.data;

      final bool success = data['success'] ?? false;
      final content = data['content'];

      if (success) {
        final token = content;

        // Save token locally
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        // Set token in ApiService for future requests
        ApiService().setToken(token);

        emit(SignInSuccess());
      } else {
        emit(SignInFailure(content.toString()));
      }
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioExeption(dioError);
      emit(SignInFailure(failure.errorMessage));
    } catch (e) {
      emit(SignInFailure("Unexpected error occurred"));
    }
  }
}
