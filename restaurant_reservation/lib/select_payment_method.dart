import 'package:flutter/material.dart';
import 'credit_card_payment.dart';
import 'reservation_success_alert.dart';

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
                'Please choose the payment method for reservation fee',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReservationSuccessPage()),
                  );
                },
                child: const Text('Pay at Restaurant', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                onPressed: () {

                  Navigator.pushReplacementNamed(context, '/creditCardPayment');
                },
                child: const Text('Credit Card',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
