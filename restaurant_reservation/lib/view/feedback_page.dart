import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../viewmodel/feedback_page_viewmodel.dart';

class FeedbackPage extends StatelessWidget {
  Future<void> saveFeedbackToDatabase(FeedbackViewModel viewModel) async {
    try {
      CollectionReference feedbackCollection =
          FirebaseFirestore.instance.collection('feedback');

      await feedbackCollection.add(
        viewModel.getFeedbackModel().toFirestore(),
      );
    } catch (e) {
      print('Error saving feedback: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    final FeedbackViewModel viewModel =
        Provider.of<FeedbackViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Give Feedback'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please Give Us Feedback on The Restaurant You Have Chosen!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < viewModel.selectedStars
                      ? Icons.star
                      : Icons.star_border,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      viewModel.updateStars(index);
                    },
                  );
                }),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: viewModel.feedbackController,
                decoration: const InputDecoration(
                  hintText: 'Enter your feedback here',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                onPressed: () async {
                  if (viewModel.isFeedbackValid()) {
                    await saveFeedbackToDatabase(viewModel);
                    Navigator.pushReplacementNamed(context, '/feedbackSuccess');
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Please give a star rating before submitting feedback.'),
                        actions: [
                          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Submit', style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
