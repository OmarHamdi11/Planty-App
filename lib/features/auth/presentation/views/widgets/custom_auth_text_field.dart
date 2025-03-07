import 'package:flutter/material.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
  });

  final IconData icon;
  final String hintText;
  final void Function(String)? onChanged;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required Field';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Container(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            icon,
            color: const Color(0xff49640F),
            size: 32,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff49640F), // Border color
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff49640F), // Focus border color
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
    );
  }
}




// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.lightYellow, // Optional background color
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Email address',
//                 hintStyle: TextStyle(
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//                 prefixIcon: Container(
//                   padding: EdgeInsets.all(12.0),
//                   child: Icon(
//                     Icons.email,
//                     color: Colors.green, // Icon color
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.green, // Border color
//                   ),
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.green, // Focus border color
//                   ),
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 contentPadding: EdgeInsets.symmetric(vertical: 16.0),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
