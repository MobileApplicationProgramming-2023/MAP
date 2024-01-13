class AccountDetailsModel {
  final String fullName;
  final String email;
  final List<String> pastReservations;

  AccountDetailsModel({
    required this.fullName,
    required this.email,
    required this.pastReservations,
  });
   factory AccountDetailsModel.fromJson(Map<String, dynamic>json){
    return AccountDetailsModel(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      pastReservations: json['pastReservations'] ?? '',
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'fullName':fullName,
      'email':email,
      'pastReservation': pastReservations,
    };
  }
  factory AccountDetailsModel.fromMap(Map<String, dynamic>map){
    return AccountDetailsModel(
      fullName: map['fullName'],
      email: map['email'],
      pastReservations: map['pastReservations'],
    );
  }
}
