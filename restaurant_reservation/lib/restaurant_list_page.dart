import 'package:flutter/material.dart';
import 'feedback_page.dart';
import 'reserve_table_page.dart';
import 'local_restaurants_page.dart';

class RestaurantListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          RestaurantListItem(
              name: 'Restaurant A',
              typeOfFood: 'Italian',
              imageUrl: 'assets/restaurant_a.jpg'),
          RestaurantListItem(
              name: 'Cafe B',
              typeOfFood: 'Coffee Shop',
              imageUrl: 'assets/cafe_b.jpg'),
          // Add more restaurants if needed
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 120),
        color: Colors.blueGrey,
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LocalRestaurantsPage()));
          },
          child: const Text('Local Restaurants',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
  final String name;
  final String typeOfFood;
  final String imageUrl;

  RestaurantListItem({
    required this.name,
    required this.typeOfFood,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(name),
        subtitle: Text(typeOfFood),
        trailing: IconButton(
          icon: const Icon(Icons.rate_review),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FeedbackPage()));
          },
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ReserveTablePage()));
        },
      ),
    );
  }
}
