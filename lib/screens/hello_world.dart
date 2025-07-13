import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World'
        '\nWelcome to Flutter',
          textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 32,
            color: Colors.blue,
            fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
}
