// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/widgets/dialog/confirm_deletion.dart';
import 'package:planty/core/widgets/dialog/upload_status.dart';
import 'package:planty/core/widgets/error_view.dart';
import 'package:planty/features/community/presentation/manager/community_cubit/community_cubit.dart';
import 'package:planty/features/community/presentation/manager/community_cubit/community_state.dart';
import 'package:planty/features/community/presentation/manager/delete_post_cubit/delete_post_cubit.dart';
import 'package:planty/features/community/presentation/manager/delete_post_cubit/delete_post_state.dart';
import 'package:planty/features/community/presentation/views/widgets/community_custom_app_bar.dart';
import 'package:planty/features/community/presentation/views/widgets/create_post_navigation_custom_button.dart';
import 'package:planty/features/community/presentation/views/widgets/custom_build_post.dart';
import 'package:planty/features/home/presentation/views/navigation_view.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CommunityCubit()..fetchPosts()),
        BlocProvider(create: (context) => DeletePostCubit()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(
          child: BlocListener<DeletePostCubit, DeletePostState>(
            listener: (context, state) {
              if (state is DeletePostSuccess) {
                showDialog(
                  context: context,
                  builder: (_) => ResultStatusDialog(
                    status: UploadStatus.success, // or UploadStatus.error
                    title: 'Deletion complete',
                    message: 'Congrats! Your post deleted successfully',
                    buttonText: 'Ok',
                    onPressed: () => Navigator.pop(context),
                  ),
                );
                context.read<CommunityCubit>().fetchPosts();
              } else if (state is DeletePostFailure) {
                showDialog(
                  context: context,
                  builder: (_) => ResultStatusDialog(
                    status: UploadStatus.error,
                    title: 'Deletion error',
                    message: state.errorMessage,
                    buttonText: 'Try again',
                    onPressed: () {
                      Navigator.pop(context);
                      // Retry logic here
                    },
                  ),
                );
              } else if (state is DeletePostLoading) {
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CommunityCustomAppBar(
                    icon: Icons.person_outline_rounded,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationView(
                            myCurrentIndex: 3,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const CreatePostNavigationCustomButton(),
                  const SizedBox(height: 16),
                  Expanded(
                    child: BlocBuilder<CommunityCubit, CommunityState>(
                      builder: (context, state) {
                        if (state is CommunityLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.primaryColor),
                          );
                        } else if (state is CommunityFailure) {
                          return ErrorView(
                            errorMessage: state.error,
                            onRetry: () {
                              context.read<CommunityCubit>().fetchPosts();
                            },
                          );
                        } else if (state is CommunitySuccess) {
                          return state.posts.isNotEmpty
                              ? ListView.builder(
                                  itemCount: state.posts.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: CustomBuildPost(
                                        post: state.posts[index],
                                        deletePost: () async {
                                          final confirm =
                                              await showDialog<bool>(
                                            context: context,
                                            builder: (_) => ConfirmDeletion(
                                              title: 'Delete Post',
                                              message:
                                                  'Are you sure you want to delete this post?',
                                              onConfirm: () {
                                                Navigator.pop(context, true);
                                                // Handle account deletion
                                              },
                                              onCancel: () {
                                                Navigator.pop(context, false);
                                              },
                                            ),
                                          );

                                          if (confirm == true) {
                                            context
                                                .read<DeletePostCubit>()
                                                .deletePost(
                                                    state.posts[index].id);
                                          }
                                        },
                                      ),
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text(
                                    'No posts yet',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
