import 'package:firebase_auth/firebase_auth.dart';

class Manager {
  final String id;
  final String username;
  final String password;

  Manager({
    required this.id,
    required this.username,
    required this.password,
  });

  factory Manager.fromJson(Map<String, dynamic> json) {
    return Manager(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  factory Manager.fromMap(Map<String, dynamic> map) {
    return Manager(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
  }

  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<Manager?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    
      User? user = _auth.currentUser;
      return Manager(
        id: user?.uid ?? '',
        username: user?.email ?? '',
        password: '',
      );
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}
