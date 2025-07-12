import 'package:flutter/material.dart';
//import 'screens/bmi_calculator.dart';
//import 'screens/landing_page.dart';
import 'screens/hello_world.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lahiru\'s First App',
      home: const HelloWorld(),
    );
  }
}
