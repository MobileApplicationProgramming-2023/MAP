import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> keepSignedInNotifier = ValueNotifier<bool>(false);

  bool get keepSignedIn => keepSignedInNotifier.value;

  bool get isInputValid {
    bool isEmailValid = _isValidEmail(emailController.text);
    bool isPasswordValid = passwordController.text.length >= 8;

    return isEmailValid && isPasswordValid;
  }

  bool _isValidEmail(String email) {
    return email.contains('@');
  }
}
