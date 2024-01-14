import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_reservation/viewmodel/owner_request_list_viewmodel.dart';
import 'package:restaurant_reservation/model/reservation.dart';

class ReserveTableViewModel extends ChangeNotifier {
  ValueNotifier<DateTime?> selectedDate = ValueNotifier<DateTime?>(null);
  ValueNotifier<TimeOfDay?> selectedTime = ValueNotifier<TimeOfDay?>(null);
  ValueNotifier<int> numberOfGuests = ValueNotifier<int>(1);

  ValueNotifier<bool> insideChecked = ValueNotifier<bool>(false);
  ValueNotifier<bool> eventZoneChecked = ValueNotifier<bool>(false);
  ValueNotifier<bool> outsideChecked = ValueNotifier<bool>(false);

  ValueNotifier<String> specialRequest = ValueNotifier<String>('');

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      notifyListeners();
    }
  }

  void selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime.value) {
      selectedTime.value = picked;
      notifyListeners();
    }
  }

  void incrementGuests() {
    numberOfGuests.value += 1;
    notifyListeners();
  }

  void decrementGuests() {
    if (numberOfGuests.value > 1) {
      numberOfGuests.value -= 1;
      notifyListeners();
    }
  }

  Future<void> reserveTable() async {
  try {
    // Access Firestore instance
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Create a Reservation object
    Reservation reservation = Reservation(
      guestNum: numberOfGuests.value,
      specialReq: specialRequest.value,
      setting: getSelectedSetting(),
      date: DateTime(
        selectedDate.value!.year,
        selectedDate.value!.month,
        selectedDate.value!.day,
        selectedTime.value!.hour,
        selectedTime.value!.minute,
      ),
      reserveid: '',
      state: 'Pending',
    );

    // Save the reservation to Firestore
    DocumentReference reservationRef =
        await firestore.collection('reservations').add(reservation.toJson());

    // Update the reservation with the generated document ID
    await reservationRef.update({'reserveid': reservationRef.id});

    // Print the reservation details
    print('Reserved Table: ${reservationRef.id} - ${reservation.toJson()}');
  } catch (e) {
    print('Failed to reserve table: $e');
  }
}


  String getSelectedSetting() {
    // Implement this method based on your checkboxes' values
    if (insideChecked.value) {
      return 'Inside';
    } else if (eventZoneChecked.value) {
      return 'Event Zone';
    } else if (outsideChecked.value) {
      return 'Outside';
    } else {
      return 'Unknown';
    }
  }
}

