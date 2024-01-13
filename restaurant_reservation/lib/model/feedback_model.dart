class FeedbackModel {
  final int stars;
  final String comment;

  FeedbackModel({required this.stars, required this.comment});
  factory FeedbackModel.fromJson(Map<String, dynamic> map) {
    return FeedbackModel(
      stars: map['stars'] ?? '',
       comment: map['comment'] ?? '',
       );
  }
  Map<String, dynamic> toJson() {
    return {
      'stars': stars,
      'comment': comment,
    };
  }

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      stars: map['stars'],
       comment: map['comment']);
  }
}
