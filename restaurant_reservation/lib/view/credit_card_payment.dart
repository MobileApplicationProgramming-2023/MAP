import 'package:flutter/material.dart';
import 'parant_reservatew/local_restaurants_page.dart';
import 'reservation_success_alert.dart';
import '../../model/credit_card_INFO.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreditCardPaymentPage extends StatefulWidget {
  final LocalRestaurant localRestaurant;

  CreditCardPaymentPage({required this.localRestaurant});

  @override
  _CreditCardPaymentPageState createState() => _CreditCardPaymentPageState();
}

class _CreditCardPaymentPageState extends State<CreditCardPaymentPage> {
  CreditCardInfo _creditCard = CreditCardInfo(Balance: null, CardNumber: null, expireDate: '');

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
                _creditCard.CardNumber = value;
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
                      _creditCard.expireDate = value;
                    },
                    decoration:
                        const InputDecoration(labelText: 'Expiration Date'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
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
              onPressed: () async {
                if (_creditCard.isValidData()) {
                  await saveReservationToDatabase();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReservationSuccessPage()),
                  );
                } else {}
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

  Future<void> saveReservationToDatabase() async {
    try {
      CollectionReference reservationsCollection =
          FirebaseFirestore.instance.collection('reservations');

      await reservationsCollection.add({
        'localRestaurantName': widget.localRestaurant.name,
        'localRestaurantTypeOfFood': widget.localRestaurant.typeOfFood,
        'reservationTime': DateTime.now(),
      });
    } catch (e) {
      print('Error saving reservation: $e');
    }
  }
}
