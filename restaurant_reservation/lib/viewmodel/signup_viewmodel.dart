import 'package:flutter/material.dart';

class SignUpViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> keepSignedInNotifier = ValueNotifier<bool>(false);

  bool get keepSignedIn => keepSignedInNotifier.value;

  bool get isInputValid {
    bool isEmailValid = _isValidEmail(emailController.text);
    bool isPhoneNumberValid = _isValidPhoneNumber(phoneNumberController.text);
    bool isPasswordValid = passwordController.text.length >= 8;

    return isEmailValid && isPhoneNumberValid && isPasswordValid;
  }

  bool _isValidEmail(String email) {
    return email.contains('@');
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    return int.tryParse(phoneNumber) != null;
  }
}
