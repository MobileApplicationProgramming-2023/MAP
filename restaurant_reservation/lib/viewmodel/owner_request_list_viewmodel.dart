import 'package:flutter/foundation.dart';
import 'package:restaurant_reservation/model/reservation.dart';
/*
class OwnerRequestListViewModel extends ChangeNotifier {
  final List<Reservation> _reservationRequests = [
    Reservation(
      userName: 'John Doe',
      dateTime: DateTime.now().add(const Duration(days: 2)),
      numberOfGuests: 3,
    ),
    Reservation(
      userName: 'Alice Smith',
      dateTime: DateTime.now().add(const Duration(days: 3, hours: 5)),
      numberOfGuests: 2,
    ),
    
  ];

  List<Reservation> get reservationRequests => _reservationRequests;

  void acceptReservation(Reservation reservation) {
   
    _removeReservation(reservation);

    notifyListeners();
  }

  void rejectReservation(Reservation reservation) {
   
    _removeReservation(reservation);

    notifyListeners();
  }

  void _removeReservation(Reservation reservation) {
    _reservationRequests.remove(reservation);
  }
}

class Reservation {
  final String userName;
  final DateTime dateTime;
  final int numberOfGuests;

  Reservation({
    required this.userName,
    required this.dateTime,
    required this.numberOfGuests,
  });
 
}
*/
 