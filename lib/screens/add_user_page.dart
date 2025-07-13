import 'package:flutter/material.dart';
import 'user_list_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  // Controllers to get input values
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController universityController = TextEditingController();

  // Function to save user to Firestore
  void saveUser() async {
    final String name = nameController.text;
    final String age = ageController.text;
    final String university = universityController.text;

    if (name.isEmpty || age.isEmpty || university.isEmpty) return;

    try {
      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'age': int.parse(age),
        'university': university,
        'timestamp': FieldValue.serverTimestamp(), // for sorting
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User added successfully')),
      );

      // Clear the fields
      nameController.clear();
      ageController.clear();
      universityController.clear();
    } catch (e) {
      print("Error saving user: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add User')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: universityController,
              decoration: InputDecoration(labelText: 'University'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveUser,
              child: Text('Save User'),
            ),
            ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserListPage()),
              );
            },
            child: const Text('View All Users'),
          ),
          ],
        ),
      ),
    );
  }
}
