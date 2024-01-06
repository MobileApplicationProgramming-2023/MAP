import 'package:flutter/material.dart';
import 'package:restaurant_reservation/model/account_details_model.dart';
class AccountDetailsViewModel extends ChangeNotifier {
  final AccountDetailsModel _accountDetails;

  AccountDetailsViewModel({required AccountDetailsModel accountDetails})
      : _accountDetails = accountDetails;

  String get fullName => _accountDetails.fullName;
  String get email => _accountDetails.email;
  List<String> get pastReservations => _accountDetails.pastReservations;
}
