import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/Todo.dart';
import 'package:untitled/pages/Splashscreen.dart';
import 'package:untitled/pages/ToDoapp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white

      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

