import 'package:flutter/material.dart';
import 'read_crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; //connect  flutter app to Firestore Database

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  //Controllers to Handle Inputs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  //Firestore Collection Reference
  final CollectionReference users = FirebaseFirestore.instance.collection(
    'users',
  );

  void addUser() async {
    String name = _nameController.text;
    String ageText = _ageController.text;

    if (name.isNotEmpty && ageText.isNotEmpty) {
      int age = int.tryParse(ageText) ?? 0; // Converts string to int safely

      await users.add({'name': name, 'age': age});

      ScaffoldMessenger.of(
        context
      ).showSnackBar(const SnackBar(content: Text('User Added')));
      _nameController.clear();
      _ageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter the name :',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height : 20),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Enter your Age :',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(onPressed: addUser, child: Text('Add User')),

            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReadPage()),
                );
              },
              child: Text('Read Users'),
            ),
          ],
        ),
      ),
    );
  }
}
