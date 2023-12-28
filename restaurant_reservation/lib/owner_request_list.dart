import 'package:flutter/material.dart';


class OwnerRequestListPage extends StatefulWidget {
  @override
  _OwnerRequestListPageState createState() => _OwnerRequestListPageState();
}

class _OwnerRequestListPageState extends State<OwnerRequestListPage> {
  List<Reservation> reservationRequests = [
    Reservation(
        userName: 'John Doe',
        dateTime: DateTime.now().add(const Duration(days: 2)),
        numberOfGuests: 3),
    Reservation(
        userName: 'Alice Smith',
        dateTime: DateTime.now().add(const Duration(days: 3,hours: 5)),
        numberOfGuests: 2),
    // Add more if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Requests'),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'viewProfile') {
                Navigator.pushNamed(context, '/restaurantProfilePage');
              } else if (value == 'logout') {
                Navigator.pushReplacementNamed(context, '/');
                _handleLogout(context);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'viewProfile',
                child: Text('View Restaurant Profile'),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: reservationRequests.isEmpty
          ? const Center(
        child: Text(
          'No reservation requests',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: reservationRequests.length,
        itemBuilder: (context, index) {
          return _buildReservationRequestCard(
              context, reservationRequests[index]);
        },
      ),
    );
  }

  Widget _buildReservationRequestCard(
      BuildContext context, Reservation reservation) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
            '${reservation.userName} - ${reservation.numberOfGuests} Guests'),
        subtitle: Text('Date: ${reservation.dateTime}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                _handleAccept(context, reservation);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: const Text('Accept',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                _handleReject(context, reservation);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
              child: const Text(
                'Reject',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleAccept(BuildContext context, Reservation reservation) {
    setState(() {
      reservationRequests.remove(reservation);
    });
  }

  void _handleReject(BuildContext context, Reservation reservation) {

    setState(() {
      reservationRequests.remove(reservation);
    });
  }
  void _handleLogout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
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
