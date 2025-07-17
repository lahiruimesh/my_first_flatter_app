import 'package:flutter/material.dart';

class TextFields extends StatelessWidget{
  const TextFields({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title: Text(
          'text field types',
        ),
      ),
      body: Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [

            Text(
              'Text Field Types',
            ),
            SizedBox(height : 10),

            TextField(
              decoration: InputDecoration(
                labelText: 'enter your email',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}