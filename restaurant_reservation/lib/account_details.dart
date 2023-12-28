import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  final String fullName = 'John Doe';
  final String email = 'Johndoe12@example.com';
  final List<String> pastReservations = ['Reservation 1', 'Reservation 2', 'Reservation 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Account Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name: $fullName',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'Past Reservations:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pastReservations.map((reservation) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text('- $reservation'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
