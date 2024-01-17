import 'package:flutter/material.dart';
import 'package:restaurant_reservation/view/signup_page.dart';
class WelcomeViewModel extends ChangeNotifier{
  final BuildContext context;

  WelcomeViewModel(this.context);

  void navigateToSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }
}