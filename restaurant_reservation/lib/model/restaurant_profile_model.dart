import 'dart:io';

class RestaurantProfileModel {
  String name;
  String information;
  File? logo;

  RestaurantProfileModel({required this.name, required this.information, this.logo});
}
