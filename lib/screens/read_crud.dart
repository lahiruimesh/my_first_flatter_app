import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference names = FirebaseFirestore.instance.collection('names');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Names from Firestore'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: names.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No names found.'));
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              var data = docs[index];
              return Card(
                child: ListTile(
                  title: Text(data['name']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
