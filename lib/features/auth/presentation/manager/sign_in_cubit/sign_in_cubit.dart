import 'package:bloc/bloc.dart';
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
      final response = await ApiService().post('/api/Account/Login', data: {
        "email": email,
        "password": password,
      });

      final token = response.data['content'];

      // Save token
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      // Set token to ApiService for future requests
      ApiService().setToken(token);

      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }
}
