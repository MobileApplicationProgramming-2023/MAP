import '../model/credit_card_model.dart';

class CreditCardViewModel {
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
}
