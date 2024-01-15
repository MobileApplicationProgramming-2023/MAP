import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/reservation.dart';
import '../viewmodel/owner_request_list_viewmodel.dart';

class OwnerRequestListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OwnerRequestListViewModel>(context);

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
      body: _buildReservationList(context),
    );
  }

  Widget _buildReservationList(BuildContext context) {
    final viewModel = Provider.of<OwnerRequestListViewModel>(context);

    return viewModel.reservationRequests.isEmpty
        ? const Center(
            child: Text(
              'No reservation requests',
              style: TextStyle(fontSize: 18),
            ),
          )
        : ListView.builder(
            itemCount: viewModel.reservationRequests.length,
            itemBuilder: (context, index) {
              return _buildReservationRequestCard(
                  context, viewModel.reservationRequests[index]);
            },
          );
  }

  Widget _buildReservationRequestCard(
      BuildContext context, Reservation reservation) {
    final viewModel = Provider.of<OwnerRequestListViewModel>(context);

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
            '${reservation.reserveid} - ${reservation.guestNum} Guests'),
        subtitle: Text('Date: ${reservation.date}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                viewModel.acceptReservation(reservation);
                _showSnackbar(context, 'Reservation accepted');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: const Text('Accept',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                viewModel.rejectReservation(reservation);
                _showSnackbar(context, 'Reservation rejected');
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

  void _handleLogout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        actionOverflowThreshold: 2,
      ),
    );
  }
}
