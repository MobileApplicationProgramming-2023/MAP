import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_reservation/view/modification_success.dart';

import '../model/restaurant.dart';

class RestaurantProfileViewModel extends ChangeNotifier {
  Restaurant model;

  RestaurantProfileViewModel({required this.model});

  Future<void> handleLogoSelection(BuildContext context) async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();

      try {
        await uploadLogoToFirebase(imageFile, imageName);
        String logoUrl = await getLogoUrl(imageName);
        model.logo = logoUrl;
        notifyListeners();
      } catch (e) {
        print('Error uploading logo: $e');
      }
    }
  }

  Future<void> uploadLogoToFirebase(File imageFile, String imageName) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('logos/$imageName.jpg');
    UploadTask uploadTask = ref.putFile(imageFile);

    await uploadTask.whenComplete(() => print('Logo uploaded'));
  }

  Future<String> getLogoUrl(String imageName) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('logos/$imageName.jpg');

    return await ref.getDownloadURL();
  }

  Future<void> fetchDataFromDatabase(String restaurantId) async {
    try {
  
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('restaurants').doc(restaurantId).get();
      if (doc.exists) {
        model = Restaurant.fromMap(doc.data() as Map<String, dynamic>);
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching data: $e');
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
              onPressed: () async {
              
                await FirebaseFirestore.instance.collection('restaurants').doc(model.id).update(model.toJson());

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ModificationSuccess()),
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
