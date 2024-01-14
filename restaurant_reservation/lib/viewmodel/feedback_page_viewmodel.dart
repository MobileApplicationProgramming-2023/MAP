import 'package:flutter/material.dart';
import 'package:restaurant_reservation/model/feedback.dart' as UserFeedback;

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

  UserFeedback.Feedback getFeedbackModel() {
    return UserFeedback.Feedback(stars: _selectedStars, comment: _feedbackController.text, idfeedback: '');
  }
}
