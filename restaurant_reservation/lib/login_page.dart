import 'package:flutter/material.dart';
import 'package:restaurant_reservation/restaurant_list_page.dart';
import 'package:restaurant_reservation/signup_page.dart';
import 'owner_request_list.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool keepSignedIn = false;
  static const String userEmail = 'user@user.com';
  static const String userPassword = 'user1234';
  static const String ownerEmail = 'owner@owner.com';
  static const String ownerPassword = 'owner123';

  bool _isInputValid() {
    bool isEmailValid = _isValidEmail(_userEmailController.text);
    bool isPasswordValid = _userPasswordController.text.length >= 8;

    return isEmailValid && isPasswordValid;
  }

  bool _isValidEmail(String email) {
    return email.contains('@');
  }

  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Sign In'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextFieldWithIcon(
                label: 'Email',
                icon: Icons.email,
                controller: _userEmailController,
              ),
              TextField(
                controller: _userPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: const Icon(Icons.lock),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: keepSignedIn,
                    onChanged: (value) {
                      setState(() {
                        keepSignedIn = value!;
                      });
                    },
                  ),
                  const Text('Keep me signed in on this phone'),
                ],
              ),
              const SizedBox(height: 16),
              const Text('New Here?', style: TextStyle(fontWeight: FontWeight.bold)),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: const Text('Click Here',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_isInputValid()) {
                    if (_userEmailController.text == userEmail && _userPasswordController.text == userPassword) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RestaurantListPage()),
                      );
                    }
                    else if (_userEmailController.text == ownerEmail && _userPasswordController.text == ownerPassword) {
                      Navigator.pushReplacementNamed(context, '/ownerRequestList');
                    }
                    else {
                      _showInvalidCredentialsDialog();
                    }
                  }
                  else {
                    _showInvalidInputDialog();
                  }
                },
                child: const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showInvalidInputDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please check your fields and try again.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showInvalidCredentialsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Credentials'),
          content: const Text('Invalid email or password. Please try again.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class TextFieldWithIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;

  const TextFieldWithIcon({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          suffixIcon: Icon(icon),
        ),
      ),
    );
  }
}
