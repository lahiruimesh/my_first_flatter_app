import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdatePage extends StatefulWidget {
  final String docId;
  final String currentName;
  final int currentAge;

  const UpdatePage({
    super.key,
    required this.docId,
    required this.currentName,
    required this.currentAge,
  });

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;

  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _ageController = TextEditingController(text: widget.currentAge.toString());
  }

  void updateUser() async {
    String updatedName = _nameController.text;
    int updatedAge = int.tryParse(_ageController.text) ?? widget.currentAge;

    await users.doc(widget.docId).update({
      'name': updatedName,
      'age': updatedAge,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✅ User Updated')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update User")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Update Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Update Age', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateUser,
              child: const Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}
