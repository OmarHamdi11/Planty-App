import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

// Function to pick an image from the gallery
Future<String> pickImageFromGallery() async {
  final XFile? pickedImage =
      await _picker.pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    return pickedImage.path;
  } else {
    return "No image selected";
  }
}

// Function to take a picture from the camera
Future<String> pickImageFromCamera() async {
  final XFile? pickedImage =
      await _picker.pickImage(source: ImageSource.camera);
  if (pickedImage != null) {
    return pickedImage.path;
  } else {
    return "No image selected";
  }
}
