class Validator {
  static String? nameValidator(String? value) {
    if (value == null) return 'Name cannot be empty';
    if (!RegExp("^[a-zA-Z ]+\$").hasMatch(value)) {
      return "Only alphabets and spaces are allowed in the Name field";
    }
    // if (!RegExp("^[a-zA-Z ]+$").hasMatch(value)) return "Only alphabets and spaces are allowed in the name";
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Email cannot be empty';
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) return 'Phone number cannot be empty';
    if (!RegExp(r'^(?:[+234]|0)[789]\d{9}$').hasMatch(value)) {
      return 'Please enter a valid Nigerian phone number';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';
    if (value.length < 8) return 'Password must be at least 8 characters long';
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) return 'Password must contain at least one uppercase letter';
    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) return 'Password must contain at least one lowercase letter';
    if (!RegExp(r'(?=.*\d)').hasMatch(value)) return 'Password must contain at least one digit';
    if (!RegExp(r'(?=.*[!@#\$&*~])').hasMatch(value)) return 'Password must contain at least one special character';
    return null;
  }
}
