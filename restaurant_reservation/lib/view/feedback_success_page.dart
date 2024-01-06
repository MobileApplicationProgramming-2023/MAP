import 'package:flutter/material.dart';
import '../viewmodel/feedback_success_viewmodel.dart';
class FeedbackSuccessPage extends StatelessWidget {
  final FeedbackSuccessViewModel viewModel;

  FeedbackSuccessPage({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Submitted'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.blueGrey,
              size: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              'Feedback Submitted Successfully!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              onPressed: () async {
                await viewModel.navigateBack(context);
              },
              child: const Text('Back to Home', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
