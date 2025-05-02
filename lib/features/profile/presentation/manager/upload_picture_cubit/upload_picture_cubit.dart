// lib/features/profile/presentation/manager/upload_picture_cubit/upload_picture_cubit.dart

import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/service/upload_profile_picture_service.dart';
import 'upload_picture_state.dart';

class UploadPictureCubit extends Cubit<UploadPictureState> {
  final UploadProfilePictureService _service;

  UploadPictureCubit(this._service) : super(UploadPictureInitial());

  Future<void> uploadProfileImage(File image) async {
    emit(UploadPictureLoading());
    try {
      final imageUrl = await _service.uploadProfilePicture(image);
      emit(UploadPictureSuccess(imageUrl));
    } catch (e) {
      emit(UploadPictureError(e.toString()));
    }
  }
}
