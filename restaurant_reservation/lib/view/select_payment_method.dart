import 'package:flutter/material.dart';
import 'reservation_success_alert.dart';
import '../model/payment_method.dart';
import 'package:provider/provider.dart';

class SelectPaymentMethod extends StatelessWidget {
  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(name: 'Pay at Restaurant', description: 'Pay when you arrive'),
    PaymentMethod(name: 'Credit Card', description: 'Secure online payment'),
  ];

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
              for (var method in paymentMethods)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                  onPressed: () {
                    if (method.name == 'Pay at Restaurant') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReservationSuccessPage()),
                      );
                    } else if (method.name == 'Credit Card') {
                      Navigator.pushReplacementNamed(context, '/creditCardPayment');
                    }
                  },
                  child: Text(method.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
