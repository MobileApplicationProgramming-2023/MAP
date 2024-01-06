import 'package:flutter/material.dart';
import 'package:restaurant_reservation/model/feedback_model.dart';
class FeedbackViewModel extends ChangeNotifier {
  int _selectedStars = 0;
  final TextEditingController _feedbackController = TextEditingController();

  int get selectedStars => _selectedStars;
  TextEditingController get feedbackController => _feedbackController;

  void updateStars(int index) {
    _selectedStars = index + 1;
    notifyListeners();
  }

  bool isFeedbackValid() {
    return _selectedStars > 0;
  }

  FeedbackModel getFeedbackModel() {
    return FeedbackModel(stars: _selectedStars, comment: _feedbackController.text);
  }
}
