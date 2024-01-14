// ignore_for_file: use_build_context_synchronously

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpViewModel extends ChangeNotifier{


  String name = '';
  String email = '';
  String password = '';
  int phonenumber = 0;

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setPhonenumber(int value) {
    phonenumber = value;
    notifyListeners();
  }


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

  Future<String?> signUp(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      

      Navigator.pushNamed(context, '/signup');
      return null;
    } on FirebaseAuthException {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('something went wrong'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
    );
}
}
}