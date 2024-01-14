import 'package:flutter/material.dart';

class ReserveTableViewModel extends ChangeNotifier{
  final ValueNotifier<DateTime?> selectedDate = ValueNotifier<DateTime?>(null);
  final ValueNotifier<TimeOfDay?> selectedTime = ValueNotifier<TimeOfDay?>(null);
  final ValueNotifier<int> numberOfGuests = ValueNotifier<int>(1);
  final ValueNotifier<bool> insideChecked = ValueNotifier<bool>(false);
  final ValueNotifier<bool> eventZoneChecked = ValueNotifier<bool>(false);
  final ValueNotifier<bool> outsideChecked = ValueNotifier<bool>(false);

  void selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  void selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
  }

  void incrementGuests() {
    numberOfGuests.value++;
  }

  void decrementGuests() {
    if (numberOfGuests.value > 1) {
      numberOfGuests.value--;
    }
  }
}
