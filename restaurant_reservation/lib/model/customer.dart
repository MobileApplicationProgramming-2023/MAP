class Customer {
  final String id;
  final String name;
  final String phoneNumber;
  final List<String> pastReserve; 
  final String username;
  final String password;
  final String email;

  Customer({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.pastReserve,
    required this.username,
    required this.password,
    required this.email,
  });
  factory Customer.fromJson(Map<String, dynamic>json){
    return Customer(
      id: json['id'] ??'',
      name: json['name']??'',
      phoneNumber: json['phoneNumber'] ??'',
      pastReserve: json['pastReserve']??'',
      username: json['username'] ??'',
      password: json['password']?? '',
      email: json['email']??'',
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'name': name,
      'phoneNumber':phoneNumber,
      'pastReserve':pastReserve,
      'username': username,
      'expirationDate':password,
      'email':email,
    };
  }
  factory Customer.fromMap(Map<String, dynamic>map){
    return Customer(
      id: map['id'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      pastReserve: map['pastReserve'],
      username: map['username'],
      password: map['password'],
      email: map['email'],
    );
  }
}
