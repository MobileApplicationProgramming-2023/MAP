import '../model/credit_card_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreditCardViewModel extends ChangeNotifier {
  CreditCardModel creditCard = CreditCardModel();

  void updateCardNumber(String value) {
    creditCard.cardNumber = value;
  }

  void updateExpirationDate(String value) {
    creditCard.expirationDate = value;
  }

  void updateCVV(String value) {
    creditCard.cvv = value;
  }

  bool isValidData() {
    return true;
  }

  Future<void> saveCreditCardToDatabase() async {
    try {
      CollectionReference creditCardCollection =
          FirebaseFirestore.instance.collection('credit_cards');

      await creditCardCollection.add({
        'cardNumber': creditCard.cardNumber,
        'expirationDate': creditCard.expirationDate,
        'cvv': creditCard.cvv,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Error saving credit card: $e');
    }
  }
}
