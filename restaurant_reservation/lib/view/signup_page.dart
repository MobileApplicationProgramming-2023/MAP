import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_reservation/viewmodel/signup_viewmodel.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpViewModel _viewModel = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignUpViewModel>(context);
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
                onChanged: (value) => viewModel.setEmail(value), 
              ),
              TextFieldWithIcon(
                label: 'UserName',
                icon: Icons.person,
                onChanged: (value) => viewModel.setName(value), 
              ),
              TextFieldWithIcon(
                label: 'Phone Number',
                icon: Icons.phone,
                onChanged: (value) => viewModel.setPhonenumber(int.parse(value)),
              ),
              TextFieldWithIcon(
                label: 'Password',
                icon: Icons.lock,
                onChanged: (value) => viewModel.setPassword(value),
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
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontSize: 15)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_viewModel.isInputValid) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  } else {
                    _showInvalidInputDialog();
                  }
                },
                child: Container(
                  child: const Text('Sign Up'),
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
  final void Function(String) onChanged;

  const TextFieldWithIcon({
    super.key,
    required this.label,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        onChanged: onChanged,
   
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