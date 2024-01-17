import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'reservation_success_alert.dart';
import '../../model/credit_card_info.dart';
import '../viewmodel/credit_card_viewmodel.dart';
import '../view/local_restaurants_page.dart';

class CreditCardPaymentPage extends StatefulWidget {
  

  @override
  _CreditCardPaymentPageState createState() => _CreditCardPaymentPageState();
}

class _CreditCardPaymentPageState extends State<CreditCardPaymentPage> {
  final CreditCardViewModel _creditCardViewModel = CreditCardViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Credit Card Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              onChanged: (value) {
                _creditCardViewModel.updateCardNumber(value);
              },
              decoration: const InputDecoration(labelText: 'Card Number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      _creditCardViewModel.updateExpirationDate(value);
                    },
                    decoration:
                        const InputDecoration(labelText: 'Expiration Date'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              onPressed: () async {
                if (_creditCardViewModel.isValidData()) {
                  await _creditCardViewModel.saveCreditCardToDatabase();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReservationSuccessPage(),
                    ),
                  );
                } else {
                  // Handle invalid data
                  _showInvalidDataDialog();
                }
              },
              child: const Text('Pay Now',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  void _showInvalidDataDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Data'),
          content: const Text('Please check your card information and try again.'),
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
