import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/utils/fonts.dart';
import 'package:planty/features/identify/presentation/views/widgets/custom_image_preview.dart';
import 'package:planty/features/identify/presentation/views/widgets/custom_pick_button.dart';
import 'package:planty/features/identify/presentation/views/widgets/identify_custom_app_bar.dart';
import 'package:planty/features/identify/presentation/views/widgets/identify_custom_divider.dart';
import 'package:planty/features/identify/presentation/views/widgets/custom_model_button.dart';
import 'package:planty/features/identify/presentation/views/widgets/model_result_custom_widget.dart';
import 'package:planty/features/identify/presentation/manager/identify_cubit/identify_cubit.dart';
import 'package:planty/features/identify/presentation/views/widgets/custom_error_widget.dart';
import 'package:planty/features/identify/presentation/views/widgets/custom_init_widget.dart';

class DiagnoseView extends StatefulWidget {
  const DiagnoseView({super.key});

  @override
  _DiagnoseViewState createState() => _DiagnoseViewState();
}

class _DiagnoseViewState extends State<DiagnoseView> {
  XFile? _image;
  String? modelOutput;
  final ImagePicker _picker = ImagePicker();

  late IdentifyCubit _identifyCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _identifyCubit = context.read<IdentifyCubit>();
  }

  @override
  void dispose() {
    _identifyCubit.reset();
    super.dispose();
  }

  // Function to pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  // Function to take a picture from the camera
  Future<void> pickImageFromCamera() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Profile Icon
              const IdentifyCustomAppBar(),
              const SizedBox(height: 20),

              // Upload Box
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: AppColors.shadowColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: _image == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.image_search_rounded,
                            size: 120,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Drag or Upload image",
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColors.primaryColor,
                              fontFamily: AppFonts.avenir,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const IdentifyCustomDivider(),
                          const SizedBox(height: 10),

                          // Buttons for picking an image
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomPickButton(
                                title: "Gallery",
                                onPressed: pickImageFromGallery,
                              ),
                              const SizedBox(width: 10),
                              CustomPickButton(
                                title: "Camera",
                                onPressed: pickImageFromCamera,
                              ),
                            ],
                          ),
                        ],
                      )
                    : CustomImagePreview(image: _image),
              ),
              const SizedBox(height: 20),

              // Identify and Clear Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomModelButton(
                    color: AppColors.primaryColor,
                    title: "Identify Diagnosis",
                    onPressed: () {
                      if (_image != null) {
                        final file = File(_image!.path);
                        _identifyCubit.identify(file);
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                  CustomModelButton(
                    color: Colors.redAccent,
                    title: "Clear Image",
                    onPressed: () {
                      setState(() {
                        _image = null;
                      });
                      _identifyCubit.reset();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Model Result Display
              BlocBuilder<IdentifyCubit, IdentifyState>(
                builder: (context, state) {
                  if (state is IdentifyLoading) {
                    return Container(
                      width: double.infinity,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    );
                  } else if (state is IdentifySuccess) {
                    return ModelResultCustomWidget(
                      // text:
                      //     "Class: ${state.result.predictedClass}\nConfidence: ${state.result.confidence}",
                      text: state.result.predictedClass,
                    );
                  } else if (state is IdentifyFailure) {
                    return const CustomErrorWidget();
                  }
                  return const CustomInitWidget(); // Default: nothing to show
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
