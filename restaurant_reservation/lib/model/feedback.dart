class Feedback {
  final String idfeedback; 
  final int stars;
  final String comment;
  Feedback({
    required this.idfeedback,
    required this.stars,
    required this.comment,
  });
  factory Feedback.fromJson(Map<String, dynamic> json){
    return Feedback(
      idfeedback: json['idfeedback'] ?? '',
      stars: json['stars'] ?? '',
      comment: json['comment'] ?? '',
      );
  }
  Map<String, dynamic> toJson(){
    return{
      'idfeedback':idfeedback,
      'stars':stars,
      'comment':comment,
    };
  }
  factory Feedback.fromMap(Map<String, dynamic> map){
    return Feedback(
      idfeedback: map['idfeedback'],
      stars: map['stars'],
      comment: map['comment'],
      );
  }
}
