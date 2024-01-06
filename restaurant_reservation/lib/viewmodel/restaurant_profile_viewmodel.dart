import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_reservation/view/modification_success.dart';
import '../model/restaurant_profile_model.dart';
import 'dart:io';

class RestaurantProfileViewModel extends ChangeNotifier {
  RestaurantProfileModel model;

  RestaurantProfileViewModel({required this.model});

  void handleLogoSelection(BuildContext context) async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      model.logo = File(pickedImage.path);
      notifyListeners();
    }
  }

  Future<void> handleSubmit(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Modification?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  ModificationSuccess()),
          );
              },
              child: const Text('Accept'),
            ),
          ],
        );
      },
    );
  }

  void handleCancel(BuildContext context) {
    Navigator.pop(context);
  }
}