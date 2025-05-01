import 'package:planty/features/community/data/models/post_model.dart';

abstract class CommunityState {}

class CommunityInitial extends CommunityState {}

class CommunityLoading extends CommunityState {}

class CommunitySuccess extends CommunityState {
  final List<PostModel> posts;
  CommunitySuccess(this.posts);
}

class CommunityFailure extends CommunityState {
  final String error;
  CommunityFailure(this.error);
}
