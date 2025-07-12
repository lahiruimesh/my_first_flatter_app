import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World',
        style: TextStyle(
          fontSize: 48,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}
