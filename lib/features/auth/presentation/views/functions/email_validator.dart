String? emailValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Required Field';
  }

  // Regular expression to validate email addresses
  String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(emailPattern);

  // Check if the email matches the pattern
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }

  // Check for other cases (you can add more if needed)
  if (value.length < 5) {
    return 'Email address is too short';
  }
  if (value.length > 50) {
    return 'Email address is too long';
  }

  return null; // Valid email
}
