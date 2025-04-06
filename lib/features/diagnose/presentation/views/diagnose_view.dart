import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:planty/core/utils/colors.dart';
import 'package:planty/core/utils/fonts.dart';
import 'package:planty/features/identify/presentation/views/widgets/custom_image_preview.dart';
import 'package:planty/features/identify/presentation/views/widgets/custom_pick_button.dart';
import 'package:planty/features/identify/presentation/views/widgets/identify_custom_app_bar.dart';
import 'package:planty/features/identify/presentation/views/widgets/identify_custom_divider.dart';
import 'package:planty/features/identify/presentation/views/widgets/custom_model_button.dart';
import 'package:planty/features/identify/presentation/views/widgets/model_result_custom_widget.dart';

class DiagnoseView extends StatefulWidget {
  const DiagnoseView({super.key});

  @override
  _DiagnoseViewState createState() => _DiagnoseViewState();
}

class _DiagnoseViewState extends State<DiagnoseView> {
  XFile? _image;
  String? modelOutput;
  final ImagePicker _picker = ImagePicker();

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
          // Main Column for the Identify View
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

              // Identify Button
              CustomModelButton(
                title: "Identify",
                onPressed: () {
                  // Call the model identification function here
                  // For now, we will just simulate a model output
                  setState(() {
                    modelOutput = "Model Output: Plant Species Identified";
                  });
                },
              ),
              const SizedBox(height: 20),
              // Model Result information
              const ModelResultCustomWidget(
                text: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
