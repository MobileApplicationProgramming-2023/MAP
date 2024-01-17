import 'package:flutter/material.dart';
import 'feedback_page.dart';
import 'reserve_table_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocalRestaurantsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Local Restaurants'),
      ),
      body: FutureBuilder(
        future: fetchLocalRestaurants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<LocalRestaurant> localRestaurants =
                snapshot.data as List<LocalRestaurant>;
            return ListView.builder(
              itemCount: localRestaurants.length,
              itemBuilder: (context, index) {
                return LocalRestaurantListItem(
                  localRestaurant: localRestaurants[index],
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<LocalRestaurant>> fetchLocalRestaurants() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('local_restaurants').get();

  return querySnapshot.docs.map((doc) {
    return LocalRestaurant(
      name: doc['name'],
      typeOfFood: doc['typeOfFood'],
      imageUrl: doc['imageUrl'],
    );
  }).toList();
}
}

class LocalRestaurantListItem extends StatelessWidget {
  final LocalRestaurant localRestaurant;

  LocalRestaurantListItem({
    required this.localRestaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(localRestaurant.imageUrl),
        ),
        title: Text(localRestaurant.name),
        subtitle: Text(localRestaurant.typeOfFood),
        trailing: IconButton(
          icon: const Icon(Icons.rate_review),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FeedbackPage()));
          },
        ),
        onTap: () {
         Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReserveTablePage(),
                      ));
        },
      ),
    );
  }
}

class LocalRestaurant {
  final String name;
  final String typeOfFood;
  final String imageUrl;

  LocalRestaurant({
    required this.name,
    required this.typeOfFood,
    required this.imageUrl,
  });
}
