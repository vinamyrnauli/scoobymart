// Importing necessary packages for Flutter and the 'menu.dart' screen
import 'package:flutter/material.dart';
import 'package:scoobymart/screens/menu.dart';

// The main entry point for the Flutter application
void main() {
  runApp(const MyApp());
}

// The root widget of the Flutter application
class MyApp extends StatelessWidget {
  // Constructor for the 'MyApp' class
  const MyApp({super.key});

  // The 'build' method defines the structure of the application's UI
  @override
  Widget build(BuildContext context) {
    // Creating a MaterialApp, which is the top-level container for the app
    return MaterialApp(
      // Setting the title of the application
      title: 'Flutter PBP',
      // Configuring the theme for the entire application
      theme: ThemeData(
        // Defining a color scheme with a seed color of 'Colors.indigo'
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),

        // Enabling the use of Material 3 design principles
        useMaterial3: true,
      ),
      // Setting the initial screen of the application to 'MyHomePage'
      home: MyHomePage(),
    );
  }
}
