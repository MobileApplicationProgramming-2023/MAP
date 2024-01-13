class CreditCardInfo {
  final String id;
  final String customerId; // Reference to the corresponding customer
  final String name; // From customer
  final double balance;
  final int cardNumber;
  final String expirationDate;

  CreditCardInfo({
    required this.id,
    required this.customerId,
    required this.name,
    required this.balance,
    required this.cardNumber,
    required this.expirationDate,
  });
}
