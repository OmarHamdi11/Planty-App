// lib/features/community/cubit/create_post_state.dart
import 'package:equatable/equatable.dart';

abstract class CreatePostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostSuccess extends CreatePostState {
  final String message;
  CreatePostSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class CreatePostFailure extends CreatePostState {
  final String error;
  CreatePostFailure(this.error);

  @override
  List<Object?> get props => [error];
}
