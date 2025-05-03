import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/errors/failure.dart';
import 'package:planty/core/service/api_service.dart';
import 'package:planty/features/profile/data/models/user_model.dart';
import 'package:planty/features/profile/presentation/manager/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ApiService _apiService = ApiService();

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    try {
      await _apiService.setTokenFromPrefs(); // Load token
      final response = await _apiService.get("/api/profile");
      final user = UserModel.fromJson(response.data);
      emit(ProfileLoaded(user));
    } on DioException catch (dioError) {
      final failure = ServerFailure.fromDioExeption(dioError);
      emit(ProfileError(failure.errorMessage));
    } catch (e) {
      emit(ProfileError("Unexpected error occurred"));
    }
  }
}
