import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Users')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          // 🔄 Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ❌ Error
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          // ✅ Data loaded
          final userDocs = snapshot.data!.docs;

          if (userDocs.isEmpty) {
            return const Center(child: Text('No users found.'));
          }

          return ListView.builder(
            itemCount: userDocs.length,
            itemBuilder: (context, index) {
              final user = userDocs[index];
              final name = user['name'];
              final age = user['age'];
              final university = user['university'];

              return ListTile(
                leading: const Icon(Icons.person),
                title: Text('$name, Age: $age'),
                subtitle: Text('University: $university'),
              );
            },
          );
        },
      ),
    );
  }
}
