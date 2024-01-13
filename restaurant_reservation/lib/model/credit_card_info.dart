class CreditCardInfo {
  final double Balance;
  final int CardNumber;
  final String expireDate;

  CreditCardInfo({
    required this.Balance,
    required this.CardNumber,
    required this.expireDate,
  });
  factory CreditCardInfo.fromJson(Map<String, dynamic>json){
    return CreditCardInfo(
      Balance: json['Balance'] ?? '',
      CardNumber: json['cardNumber']?? '',
      expireDate: json['expirationDate'] ?? '',
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'Balance':Balance,
      'CardNumber': CardNumber,
      'expireDate':expireDate,
    };
  }
  factory CreditCardInfo.fromMap(Map<String, dynamic>map){
    return CreditCardInfo(
      Balance: map['Balance'],
      CardNumber: map['CardNumber'],
      expireDate: map['expireDate'],
    );
  }
}
