import 'package:flutter/material.dart';
import 'package:restaurant_reservation/viewmodel/restaurant_list_viewmodel.dart';
import 'feedback_page.dart';
import 'reserve_table_page.dart';
import 'local_restaurants_page.dart';
import 'package:provider/provider.dart';


class RestaurantListPage extends StatelessWidget {
  final RestaurantListViewModel _viewModel = RestaurantListViewModel();

  @override
  Widget build(BuildContext context) {
    final RestaurantListViewModel viewModel =
        Provider.of<RestaurantListViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Restaurant Listings'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _showPopupMenu(context);
          },
        ),
      ),
      body: ValueListenableBuilder<List<RestaurantItemViewModel>>(
        valueListenable: _viewModel.restaurantsNotifier,
        builder: (context, restaurants, _) {
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantListItem(
                viewModel: restaurants[index],
                onFeedbackTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()),
                  );
                },
                onReserveTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReserveTablePage()),
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 120),
        color: Colors.blueGrey,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LocalRestaurantsPage()),
            );
          },
          child: const Text(
            'Local Restaurants',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, kToolbarHeight, 0, 0),
      items: [
        const PopupMenuItem(
          value: 'accountDetails',
          child: Text('Account Details'),
        ),
        const PopupMenuItem(
          value: 'logout',
          child: Text('Logout'),
        ),
      ],
    ).then((value) {
      if (value == 'accountDetails') {
        Navigator.pushNamed(context, '/accountDetails');
      } else if (value == 'logout') {
        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }
}

class RestaurantListItem extends StatelessWidget {
  final RestaurantItemViewModel viewModel;
  final VoidCallback onFeedbackTap;
  final VoidCallback onReserveTap;

  RestaurantListItem({
    required this.viewModel,
    required this.onFeedbackTap,
    required this.onReserveTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(viewModel.imageUrl),
        ),
        title: Text(viewModel.name),
        subtitle: Text(viewModel.typeOfFood),
        trailing: IconButton(
          icon: const Icon(Icons.rate_review),
          onPressed: onFeedbackTap,
        ),
        onTap: onReserveTap,
      ),
    );
  }
}
