import 'package:eventease/models/events.dart';
import 'package:eventease/screens/events_screens.dart';
import 'package:eventease/screens/welcome_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return allEvents();
      },
      child: MaterialApp(
        title: "Event Ticket App",
        home: WelcomeScreens(),
        theme: ThemeData(
          fontFamily: 'Calibri',
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Color.fromARGB(255, 33, 33, 33))
          ) 
        ),
        routes: {
          EventsScreens.routeName: (context) => EventsScreens() 
        },
      ),
    );
  }
}