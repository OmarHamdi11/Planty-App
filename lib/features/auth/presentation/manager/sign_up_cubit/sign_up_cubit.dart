import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:planty/core/errors/failure.dart';
import 'package:planty/core/service/api_service.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final ApiService _apiService = ApiService();

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());
    try {
      final response = await _apiService.post(
        '/api/Account/Register',
        data: {
          "username": username,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );

      if (response.data["success"] == false) {
        emit(SignUpFailure(
          error: response.data["content"][0] ?? "Registration failed!",
        ));
      } else {
        emit(SignUpSuccess(
          message: response.data["content"] ?? "Registration succeeded!",
        ));
      }
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioExeption(dioError);
      emit(SignUpFailure(error: failure.errorMessage));
    } catch (e) {
      emit(SignUpFailure(error: "Unexpected error occurred"));
    }
  }
}
