import 'package:flutter/material.dart';
import 'package:restaurant_reservation/model/restaurant.dart';
import 'package:restaurant_reservation/view/local_restaurants_page.dart';
import 'package:restaurant_reservation/viewmodel/restaurant_list_viewmodel.dart';
import 'feedback_page.dart';
import 'reserve_table_page.dart';
import 'package:provider/provider.dart';

class RestaurantListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RestaurantListViewModel _viewModel =
        Provider.of<RestaurantListViewModel>(context);

    // Call fetchRestaurants when the widget is first built
    _viewModel.fetchRestaurants();

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
      body: ValueListenableBuilder<List<Restaurant>>(
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
  final Restaurant viewModel;
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
          backgroundImage: NetworkImage(viewModel.logo),
        ),
        title: Text(viewModel.name),
        subtitle: Text(viewModel.desc),
        trailing: IconButton(
          icon: const Icon(Icons.rate_review),
          onPressed: onFeedbackTap,
        ),
        onTap: onReserveTap,
      ),
    );
  }
}
