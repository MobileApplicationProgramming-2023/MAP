import 'package:flutter/material.dart';
class FeedbackSuccessViewModel extends ChangeNotifier{

  Future<void> navigateBack(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4)); 
    Navigator.pop(context);
  }
}
