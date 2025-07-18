import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; //Initializes Firebase core services in app
//import 'screens/bmi_calculator.dart';
//import 'screens/landing_page.dart';
//import 'screens/hello_world.dart';
//import 'screens/columns.dart';
//import 'screens/buttons.dart';
//import 'screens/add_user_page.dart';
//import 'screens/homepage.dart';
//import 'screens/textfields.dart';
import 'screens/create_crud.dart';
import 'screens/read_crud.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Lahiru\'s First App', home: const CreatePage());
  }
}
