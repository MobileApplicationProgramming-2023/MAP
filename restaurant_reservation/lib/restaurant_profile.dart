import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RestaurantProfilePage extends StatefulWidget {
  @override
  _RestaurantProfilePageState createState() => _RestaurantProfilePageState();
}

class _RestaurantProfilePageState extends State<RestaurantProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _infoController = TextEditingController();
  File? _selectedImage;
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
              _buildTextField('Name', _nameController),
              const SizedBox(height: 36),
              _buildTextField('Information', _infoController),
              const SizedBox(height: 56),
              _buildLogoButton(),
              const SizedBox(height: 132),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _handleSubmit();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey),
                    child: const Text('Submit',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _handleCancel();
                    },
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

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _buildLogoButton() {
    return ElevatedButton(
      onPressed: () {
        _pickImageFromGallery();
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
      child: const Text('Choose Logo',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }

  void _handleSubmit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Modification?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/modificationSuccess');
              },
              child: const Text('Accept'),
            ),
          ],
        );
      },
    );
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
