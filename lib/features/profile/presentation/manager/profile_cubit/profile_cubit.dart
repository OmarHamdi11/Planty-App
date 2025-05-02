import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/service/api_service.dart';
import 'package:planty/features/profile/data/models/user_model.dart';
import 'package:planty/features/profile/presentation/manager/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ApiService _apiService = ApiService();

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    try {
      await _apiService.setTokenFromPrefs(); // load token first
      final response = await _apiService.get("/api/profile");
      final user = UserModel.fromJson(response.data);
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
