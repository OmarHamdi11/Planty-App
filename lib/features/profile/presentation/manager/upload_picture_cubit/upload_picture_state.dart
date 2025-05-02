abstract class UploadPictureState {}

class UploadPictureInitial extends UploadPictureState {}

class UploadPictureLoading extends UploadPictureState {}

class UploadPictureSuccess extends UploadPictureState {
  final String imageUrl;
  UploadPictureSuccess(this.imageUrl);
}

class UploadPictureError extends UploadPictureState {
  final String message;
  UploadPictureError(this.message);
}
