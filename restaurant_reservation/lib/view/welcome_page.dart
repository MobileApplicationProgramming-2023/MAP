import 'package:flutter/material.dart';
import 'package:restaurant_reservation/viewmodel/welcome_viewmodel.dart';
import 'package:restaurant_reservation/view/signup_page.dart';
class WelcomePage extends StatelessWidget {
  final WelcomeViewModel viewModel;  // Add this line

  const WelcomePage({Key? key, required this.viewModel}) : super(key: key);  // Modify the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.table_restaurant_outlined,
              size: 150,
              color: Colors.blueGrey,
            ),
            const SizedBox(height: 16),
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Reserve Table',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: const Text('Get Started', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
