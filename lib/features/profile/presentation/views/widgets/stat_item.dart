import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final String title;
  final String value;

  const StatItem(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}



































































































// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});

//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   bool _obscurePassword = true;

//   final nameController = TextEditingController(text: "Hussien Amer");
//   final emailController = TextEditingController(text: "hussien@example.com");
//   final passwordController = TextEditingController(text: "password123");

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() => _image = File(pickedFile.path));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFDFCE5),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             const Text(
//               "Your Profile",
//               style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: _pickImage,
//               child: CircleAvatar(
//                 backgroundColor: Colors.grey[300],
//                 radius: 50,
//                 backgroundImage: _image != null ? FileImage(_image!) : null,
//                 child:
//                     _image == null ? const Icon(Icons.person, size: 50) : null,
//               ),
//             ),
//             const SizedBox(height: 12),
//             _editableField("Name", nameController),
//             _editableField("Email", emailController),
//             _editableField("Password", passwordController, isPassword: true),
//             const SizedBox(height: 12),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 StatItem("Posts", "0"),
//                 SizedBox(width: 30),
//                 StatItem("Comments", "0"),
//               ],
//             ),
//             const SizedBox(height: 40),
//             const Column(
//               children: [
//                 Icon(
//                   Icons.camera_alt_outlined,
//                   size: 60,
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "No Posts Yet",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _editableField(String label, TextEditingController controller,
//       {bool isPassword = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
//       child: TextField(
//         controller: controller,
//         obscureText: isPassword ? _obscurePassword : false,
//         decoration: InputDecoration(
//           labelText: label,
//           border: const OutlineInputBorder(),
//           suffixIcon: isPassword
//               ? IconButton(
//                   icon: Icon(
//                     _obscurePassword ? Icons.visibility : Icons.visibility_off,
//                   ),
//                   onPressed: () {
//                     setState(
//                       () {
//                         _obscurePassword = !_obscurePassword;
//                       },
//                     );
//                   },
//                 )
//               : null,
//         ),
//       ),
//     );
//   }
// }

// class StatItem extends StatelessWidget {
//   final String title;
//   final String value;

//   const StatItem(this.title, this.value, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }
// }
