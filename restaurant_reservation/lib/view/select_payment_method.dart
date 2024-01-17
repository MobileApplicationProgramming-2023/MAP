import 'package:flutter/material.dart';
import 'reservation_success_alert.dart';
import '../model/credit_card_info.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SelectPaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Choose Payment Method'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please choose the payment method for the reservation fee',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey),
                onPressed: () async {
                  CreditCardInfo method = CreditCardInfo(
                    Balance: null,
                    CardNumber: null,
                    expireDate: '',
                  );
                  await savePaymentMethodToDatabase(method);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReservationSuccessPage(),
                    ),
                  );
                },
                child: Text(
                  'Pay at Restaurant',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey),
                onPressed: () async {
                  CreditCardInfo method = CreditCardInfo(
                    Balance: null,
                    CardNumber: null,
                    expireDate: '',
                  );
                  await savePaymentMethodToDatabase(method);
                  Navigator.pushReplacementNamed(
                      context, '/creditCardPayment');
                },
                child: Text(
                  'Credit Card',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> savePaymentMethodToDatabase(CreditCardInfo method) async {
    try {
      CollectionReference paymentMethodsCollection =
          FirebaseFirestore.instance.collection('payment_methods');

      await paymentMethodsCollection.add({
        'CardNumber': method.CardNumber,
        'expireDate': method.expireDate,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Error saving payment method: $e');
    }
  }
}
