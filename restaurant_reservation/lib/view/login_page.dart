import 'package:flutter/material.dart';
import 'package:restaurant_reservation/viewmodel/login_viewmodel.dart';
import 'restaurant_list_page.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInViewModel _viewModel = SignInViewModel();

  @override
  Widget build(BuildContext context) {
    final SignInPage viewModel =
        Provider.of<SignInPage>(context, listen: false);
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
                controller: _viewModel.emailController,
              ),
              TextField(
                controller: _viewModel.passwordController,
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
                    value: _viewModel.keepSignedIn,
                    onChanged: (value) {
                      _viewModel.keepSignedInNotifier.value = value ?? false;
                    },
                  ),
                  const Text('Keep me signed in on this phone'),
                ],
              ),

              ElevatedButton(
                onPressed: () {
                  if (_viewModel.isInputValid) {
                    _handleLogin();
                  } else {
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

  void _handleLogin() {
    if (_viewModel.emailController.text == 'user@user.com' && _viewModel.passwordController.text == 'user1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RestaurantListPage()),
      );
    }
    else if (_viewModel.emailController.text == 'owner@owner.com' && _viewModel.passwordController.text == 'owner123') {
      Navigator.pushReplacementNamed(context, '/ownerRequestList');
    }
    else {
      _showInvalidCredentialsDialog();
    }
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
