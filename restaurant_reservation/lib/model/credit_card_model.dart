class CreditCardModel {
  String cardNumber = '';
  String expirationDate = '';
  String cvv = '';

  bool isValidData() {
    return _isValidCardNumber() && _isValidExpirationDate() && _isValidCVV();
  }

  bool _isValidCardNumber() {
    return cardNumber.isNotEmpty && cardNumber.length == 16;
  }

  bool _isValidExpirationDate() {
    return expirationDate.isNotEmpty;
  }

  bool _isValidCVV() {
    return cvv.isNotEmpty && cvv.length == 3;
  }
}
