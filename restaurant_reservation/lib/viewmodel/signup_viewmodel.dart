// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/customer.dart';

class SignUpViewModel extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';
  int phonenumber = 0;

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setPhonenumber(int value) {
    phonenumber = value;
    notifyListeners();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> keepSignedInNotifier = ValueNotifier<bool>(false);

  bool get keepSignedIn => keepSignedInNotifier.value;

  Future<String?> signUp(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Customer customer = Customer(
        id: userCredential.user?.uid ?? '',
        name: name,
        phoneNumber: phonenumber.toString(),
        pastReserve: [],
        username: name,
        password: password,
        email: email,
      );

      await FirebaseFirestore.instance
          .collection('customers')
          .doc(customer.id)
          .set(customer.toJson());

      setName('');
      setEmail('');
      setPassword('');
      setPhonenumber(0);

      Navigator.pushNamed(context, '/signupSuccess');

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
