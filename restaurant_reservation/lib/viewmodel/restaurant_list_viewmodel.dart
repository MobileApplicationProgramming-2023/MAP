import 'package:flutter/material.dart';
import 'package:restaurant_reservation/model/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantListViewModel extends ChangeNotifier {
  final ValueNotifier<List<Restaurant>> restaurantsNotifier =
      ValueNotifier<List<Restaurant>>([]);

 final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Restaurant> restaurantList = [];

  Future<void> fetchRestaurants() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('restaurant').where('role', isEqualTo: 'regular').get();

     restaurantList = snapshot.docs
    .map(
      (DocumentSnapshot<Map<String, dynamic>> doc) =>
          Restaurant.fromMap(doc.data()!..['id'] = doc.id),
    )
    .toList();
      notifyListeners();
    } catch (e) {
      print('Failed to fetch Restaurants: $e');
    }
  }
}
