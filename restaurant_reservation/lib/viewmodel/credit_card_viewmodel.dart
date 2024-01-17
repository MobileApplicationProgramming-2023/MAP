import '../model/credit_card_info.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreditCardViewModel extends ChangeNotifier {
  CreditCardInfo creditCard = CreditCardInfo(Balance: null, CardNumber: null, expireDate: '');

  void updateCardNumber(String value) {
    creditCard.CardNumber = int.tryParse(value) ?? 0; 
    notifyListeners(); 
  }

  void updateExpirationDate(String value) {
    creditCard.expireDate = value;
    notifyListeners(); 
  }

  bool isValidData() {
  if (creditCard.CardNumber! <= 0) {
    return false;
  }

  RegExp dateRegExp = RegExp(r'^\d{2}/\d{2}$');
  if (!dateRegExp.hasMatch(creditCard.expireDate)) {
    return false;
  }

  return true;
}

  Future<void> saveCreditCardToDatabase() async {
    try {
      CollectionReference creditCardCollection =
          FirebaseFirestore.instance.collection('credit_cards');

      await creditCardCollection.add({
        'cardNumber': creditCard.CardNumber,
        'expirationDate': creditCard.expireDate,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Error saving credit card: $e');
    }
  }
}
