String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Required Field';
  }

  // Check for minimum length (e.g., 8 characters)
  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  // Check for at least one uppercase letter
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  }

  // Check for at least one lowercase letter
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  }

  // Check for at least one digit
  if (!RegExp(r'\d').hasMatch(value)) {
    return 'Password must contain at least one digit';
  }

  // Check for at least one special character
  if (!RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(value)) {
    return 'Password must contain at least one special character';
  }

  return null;
}
