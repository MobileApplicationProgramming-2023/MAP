import 'package:flutter/material.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool keepSignedIn = false;

  bool _isInputValid() {
    bool isEmailValid = _isValidEmail(_emailController.text);
    bool isPhoneNumberValid = _isValidPhoneNumber(_phoneNumberController.text);
    bool isPasswordValid = _passwordController.text.length >= 8;

    return isEmailValid && isPhoneNumberValid && isPasswordValid;
  }

  bool _isValidEmail(String email) {
    return email.contains('@');
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    return int.tryParse(phoneNumber) != null;
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.blueGrey[500],
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
                'Sign Up',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextFieldWithIcon(
                label: 'Email',
                icon: Icons.email,
                controller: _emailController,
              ),
              TextFieldWithIcon(
                  label: 'UserName',
                  icon: Icons.person,
                  controller: _usernameController),
              TextFieldWithIcon(
                label: 'Phone Number',
                icon: Icons.phone,
                controller: _phoneNumberController,
              ),
              TextFieldWithIcon(
                label: 'Password',
                icon: Icons.lock,
                controller: _passwordController,
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
              const Text('Already a Member?',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: const Text('Click here',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink,fontSize: 15)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_isInputValid()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  } else {
                    _showInvalidInputDialog();
                  }
                },
                child: Container(
                  child: Text('Sign Up'),
                  color: Colors.white,
                ),
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
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
