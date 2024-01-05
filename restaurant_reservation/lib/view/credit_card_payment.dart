import 'package:flutter/material.dart';
import 'reservation_success_alert.dart';
import '../../model/credit_card_model.dart';  // Import the CreditCardModel

class CreditCardPaymentPage extends StatefulWidget {
  @override
  _CreditCardPaymentPageState createState() => _CreditCardPaymentPageState();
}

class _CreditCardPaymentPageState extends State<CreditCardPaymentPage> {
  CreditCardModel _creditCard = CreditCardModel();  // Initialize the CreditCardModel

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
                // Update cardNumber in the ViewModel when the text changes
                _creditCard.cardNumber = value;
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
                      // Update expirationDate in the ViewModel when the text changes
                      _creditCard.expirationDate = value;
                    },
                    decoration: const InputDecoration(labelText: 'Expiration Date'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      // Update cvv in the ViewModel when the text changes
                      _creditCard.cvv = value;
                    },
                    decoration: const InputDecoration(labelText: 'CVV'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              onPressed: () {
                // Validate the credit card data before proceeding
                if (_creditCard.isValidData()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ReservationSuccessPage()),
                  );
                } else {
                  // Handle invalid data, show a message, etc.
                }
              },
              child: const Text('Pay Now', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
