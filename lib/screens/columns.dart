import 'package:flutter/material.dart';

class Columns extends StatelessWidget{
  const Columns({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'sentence 01',
              style: TextStyle(
                fontSize: 32,
                color: Colors.blue,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'sentence 02',
              style: TextStyle(
                fontSize: 30,
                color: const Color.fromARGB(255, 238, 23, 34),
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}