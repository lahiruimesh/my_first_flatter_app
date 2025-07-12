import 'package:flutter/material.dart';
import 'screens/bmi_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lahiru\'s First App',
      home: const BMICalculator(),
    );
  }
}
