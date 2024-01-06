import 'package:flutter/material.dart';
import 'package:restaurant_reservation/view/owner_request_list.dart';

class ModificationSuccess extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modification Success'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your modification was successful!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>OwnerRequestListPage()));
              }
              ,child: const Text(
                'Back to Requests',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
