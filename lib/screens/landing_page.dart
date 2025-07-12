import 'package:flutter/material.dart';
import 'bmi_calculator.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome BMI Calculator"
              "\n\n Press Button to Start",
              style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,),
            ),
            const SizedBox(height: 30), // spacing
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BMICalculator()),
                );
              },
              child: const Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}
