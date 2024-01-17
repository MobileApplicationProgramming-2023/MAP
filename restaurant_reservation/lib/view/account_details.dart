import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/account_details_viewmodel.dart';
import '../model/Customer.dart';
class AccountDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountDetailsModel = Customer(
       name: '',
        id: '',
        email: '',
        password: '', 
        pastReserve: [],
        phoneNumber: '',
        username: '',
    );

    return ChangeNotifierProvider(
      create: (context) => CustomerViewModel(customer: accountDetailsModel),
      child: _AccountDetailsPageContent(),
    );
  }
}

class _AccountDetailsPageContent extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    var viewModel = Provider.of<CustomerViewModel>(context);

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
              'Full Name: ${viewModel.name}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Email: ${viewModel.email}',
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
              children: viewModel.pastReserve.map((reservation) {
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
