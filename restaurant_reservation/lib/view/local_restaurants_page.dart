import 'package:flutter/material.dart';
import 'feedback_page.dart';
import 'reserve_table_page.dart';

class LocalRestaurantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Local Restaurants'),
      ),
      body: ListView(
        children: [
          LocalRestaurantListItem(name: 'Local Eatery', typeOfFood: 'Local Cuisine', imageUrl: 'assets/local_eatery.jpg'),
          LocalRestaurantListItem(name: 'Diner Delight', typeOfFood: 'Diner', imageUrl: 'assets/diner_delight.jpg'),
          // Add more local restaurants if needed
        ],
      ),
    );
  }
}

class LocalRestaurantListItem extends StatelessWidget {
  final String name;
  final String typeOfFood;
  final String imageUrl;

  LocalRestaurantListItem({
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackPage()));
          },
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReserveTablePage()));

        },
      ),
    );
  }
}
