import 'package:flutter/material.dart';
import 'package:restaurant_reservation/view/restaurant_list_page.dart';
class ReservationSuccessViewModel extends ChangeNotifier{
  void navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RestaurantListPage()),
    );
  }
}
