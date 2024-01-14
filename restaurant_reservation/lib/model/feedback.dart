import 'package:cloud_firestore/cloud_firestore.dart';

class Feedback {
  final String idfeedback;
  final int stars;
  final String comment;

  Feedback({
    required this.idfeedback,
    required this.stars,
    required this.comment,
  });

  factory Feedback.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Feedback(
      idfeedback: doc.id,
      stars: data['stars'] ?? 0,
      comment: data['comment'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'stars': stars,
      'comment': comment,
    };
  }
}
