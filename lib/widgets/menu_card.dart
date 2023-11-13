// Importing necessary packages for Flutter and custom screens.
import 'package:flutter/material.dart';
import 'package:scoobymart/screens/scoobymart_form.dart';
import 'package:scoobymart/screens/scoobymart_show.dart';

// Defining a class to represent items in the shop.
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  // Constructor for the ShopItem class.
  ShopItem(this.name, this.icon, this.color);
}

// Defining a class to represent individual items in the shop.
class Items {
  final String name;
  final int price;
  final String description;

  // Constructor for the Items class.
  Items({required this.name, required this.price, required this.description});
}

// A stateless widget representing a card in the shop.
class ShopCard extends StatelessWidget {
  final ShopItem item;

  // Constructor for the ShopCard class.
  const ShopCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    // Creating a Material widget with an InkWell for touch interaction.
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          // Displaying a SnackBar when the card is tapped.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You have pressed the ${item.name} button!")));

          // Navigating to the appropriate route based on the button pressed.
          if (item.name == "Add an Item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShopFormPage()),
            );
          }

          if (item.name == "Show Items") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShowItem()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
