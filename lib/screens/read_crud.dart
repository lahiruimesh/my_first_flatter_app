import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Names from Firestore'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No users found.'));
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              var data = docs[index];
              String name = data['name'];
              int age = data['age'];
              return Card(
                child: ListTile(
                  title: Text(name),
                  subtitle: Text('$age'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
