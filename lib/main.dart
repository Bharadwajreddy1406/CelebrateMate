import 'package:_AMULYA_/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:_AMULYA_/pages/pop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    if (currentDate.month == 12 && currentDate.day == 1) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amulya',
        theme: ThemeData(
          primarySwatch:Colors.indigo,
        ),
        home: popUP(), // Showing PopUp widget
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amulya',
        theme: ThemeData(
          primarySwatch:Colors.indigo,

        ),
        home: Home(), // Showing Home widget
      );
    }
  }
}





