import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../model/reservation.dart';

class OwnerRequestListViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'reservationRequests';

  List<Reservation> _reservationRequests = [];

  List<Reservation> get reservationRequests => _reservationRequests;

  OwnerRequestListViewModel() {
    _fetchReservationRequests();
  }

  Future<void> _fetchReservationRequests() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection(collectionName).get();
      _reservationRequests = snapshot.docs
          .map((doc) => Reservation.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching reservation requests: $e');
    }
  }

  Future<void> acceptReservation(Reservation reservation) async {
    try {
      await _firestore.collection(collectionName).doc(reservation.reserveid).delete();
      _fetchReservationRequests();
    } catch (e) {
      print('Error accepting reservation: $e');
    }
  }

  Future<void> rejectReservation(Reservation reservation) async {
    try {
      await _firestore.collection(collectionName).doc(reservation.reserveid).delete();
      _fetchReservationRequests();
    } catch (e) {
      print('Error rejecting reservation: $e');
    }
  }
}
