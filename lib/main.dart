import 'package:eventease/screens/welcome_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Event Ticket App",
      home: WelcomeScreens(),
    );
  }
}