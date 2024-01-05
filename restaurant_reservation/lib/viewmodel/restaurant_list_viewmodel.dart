import 'package:flutter/material.dart';

class RestaurantListViewModel {
  final ValueNotifier<List<RestaurantItemViewModel>> restaurantsNotifier =
      ValueNotifier<List<RestaurantItemViewModel>>([]);

  RestaurantListViewModel() {
    _initRestaurants();
  }

  void _initRestaurants() {

    List<RestaurantItemViewModel> restaurants = [
      RestaurantItemViewModel(
        name: 'Restaurant A',
        typeOfFood: 'Italian',
        imageUrl: 'assets/restaurant_a.jpg',
      ),
      RestaurantItemViewModel(
        name: 'Cafe B',
        typeOfFood: 'Coffee Shop',
        imageUrl: 'assets/cafe_b.jpg',
      ),
      // Add more restaurants if needed
    ];

    restaurantsNotifier.value = restaurants;
  }
}

class RestaurantItemViewModel {
  final String name;
  final String typeOfFood;
  final String imageUrl;

  RestaurantItemViewModel({
    required this.name,
    required this.typeOfFood,
    required this.imageUrl,
  });
}
