// Importing necessary packages for Flutter and custom screens/widgets.
import 'package:flutter/material.dart';
import 'package:scoobymart/widgets/left_drawer.dart';
import 'package:scoobymart/screens/scoobymart_form.dart';
import 'package:scoobymart/widgets/menu_card.dart';

// A StatefulWidget representing the 'Show Items' screen.
class ShowItem extends StatefulWidget {
  // Constructor for the ShowItem class.
  const ShowItem({super.key});

  @override
  State<StatefulWidget> createState() => _ShowItemPage();
}

// The corresponding State class for the 'ShowItem' screen.
class _ShowItemPage extends State<ShowItem> {
  @override
  Widget build(BuildContext context) {
    // Building the scaffold for the 'Show Items' screen.
    return Scaffold(
      // Setting up the app bar with a title and styling.
      appBar: AppBar(
        title: const Text('Items'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),

      // Including the LeftDrawer widget for navigation.
      drawer: const LeftDrawer(),

      // Building a ListView of items with a ListTile for each item.
  
    );
  }
}
