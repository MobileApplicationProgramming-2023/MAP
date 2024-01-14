import 'package:flutter/material.dart';
import 'package:restaurant_reservation/model/Customer.dart';
class CustomerViewModel extends ChangeNotifier {
  final Customer _customer;

  CustomerViewModel({required Customer customer})
      : _customer = customer;

  String get id => _customer.id;
  String get name=> _customer.name;
  String get phoneNumber=> _customer.phoneNumber;
  List<String> get pastReserve=>_customer.pastReserve;
  String get username=>_customer.username;
  String get password=>_customer.password;
  String get email => _customer.email;
}
