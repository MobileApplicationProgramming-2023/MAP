class Manager {
  final String id;
  final String username;
  final String password;

  Manager({
    required this.id,
    required this.username,
    required this.password,
  });
  factory Manager.fromJson(Map<String, dynamic> json){
    return Manager(id: json['id'] ?? '', username: json['username'] ?? '', password: json['password'] ?? '');
  }
  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'username':username,
      'password':password,
    };
  }
  factory Manager.fromMap(Map<String, dynamic> map){
    return Manager(
      id: map['id'],
       username: map['username'],
        password: map['password']
        );
  }
}
