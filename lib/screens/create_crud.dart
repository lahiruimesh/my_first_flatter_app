import 'package:flutter/material.dart';
import 'read_crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _controller = TextEditingController();

  final CollectionReference names = FirebaseFirestore.instance.collection(
    'names',
  );

  void addName() async {
    if (_controller.text.isNotEmpty) {
      await names.add({'name': _controller.text});
      print("✅ Name Added: ${_controller.text}");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Name Added')));
      _controller.clear();
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
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter the name :',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: addName, child: Text('Add Name')),

            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReadPage()),
                );
              },
              child: Text('Read Names'),
            ),
          ],
        ),
      ),
    );
  }
}
