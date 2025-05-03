abstract class DeleteCommentState {}

class DeleteCommentInitial extends DeleteCommentState {}

class DeleteCommentLoading extends DeleteCommentState {}

class DeleteCommentSuccess extends DeleteCommentState {
  final String message;
  DeleteCommentSuccess(this.message);
}

class DeleteCommentFailure extends DeleteCommentState {
  final String error;
  DeleteCommentFailure(this.error);
}
