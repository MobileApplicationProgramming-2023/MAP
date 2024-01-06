import 'package:flutter/material.dart';
import '../viewmodel/restaurant_profile_viewmodel.dart';

class RestaurantProfilePage extends StatelessWidget {
  final RestaurantProfileViewModel viewModel;

  RestaurantProfilePage({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Restaurant Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Modify your restaurant\'s profile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 36),
              _buildTextField('Name', viewModel.model.name, (value) => viewModel.model.name = value),
              const SizedBox(height: 36),
              _buildTextField('Information', viewModel.model.information, (value) => viewModel.model.information = value),
              const SizedBox(height: 56),
              _buildLogoButton(context),
              const SizedBox(height: 132),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => viewModel.handleSubmit(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey),
                    child: const Text('Submit',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    onPressed: () => viewModel.handleCancel(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    child: const Text('Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value, ValueChanged<String> onChanged) {
    return TextField(
      onChanged: onChanged,
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _buildLogoButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => viewModel.handleLogoSelection(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
      child: const Text('Choose Logo',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }
}
