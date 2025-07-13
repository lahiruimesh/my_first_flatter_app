import 'package:flutter/material.dart';
import 'hello_world.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 90, 207, 86),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple], // 🎨 Start to end colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hii',
              style:TextStyle(
                fontSize: 32,
                color: Colors.blue,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => const HelloWorld()),
                );
                print('Button Pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink
              ),
              child: Text(
                'Press Me',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
            'assets/a1.png',
            width: 600,
            height: 600,
          ),
          ],
        ),
      ),
    );
  }
}