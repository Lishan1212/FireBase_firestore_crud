// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/pages/home_page.dart';
import 'package:firebase_crud/pages/login.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          // ignore: avoid_print
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home:LoginScreen(),
            title: 'Flutter Firestore CRUD',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
//home: HomePage(),
          );
        }
        // ignore: prefer_const_constructors
        return CircularProgressIndicator();
      },
    );
  }
}