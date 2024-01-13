class Restaurant {
  final String id;
  final String name;
  final String logo;
  final String desc;

  Restaurant({
    required this.id,
    required this.name,
    required this.logo,
    required this.desc,
  });
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        logo: json['logo'] ?? '',
        desc: json['desc'] ?? '');
  }
  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'name': name,
      'logo': logo,
      'desc':desc,
    };
  }
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
        id: map['id'],
        name: map['name'],
        logo: map['logo'],
        desc: map['desc']);
  }
}
