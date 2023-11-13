// Importing necessary packages for Flutter and custom widgets.
import 'package:flutter/material.dart';
import 'package:scoobymart/widgets/left_drawer.dart';
import 'package:scoobymart/widgets/menu_card.dart';

// A list to store items added through the form.
List<Items> items = [];

// A StatefulWidget representing the 'Add Item' form.
class ShopFormPage extends StatefulWidget {
  // Constructor for the ShopFormPage class.
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

// The corresponding State class for the 'Add Item' form.
class _ShopFormPageState extends State<ShopFormPage> {
  // GlobalKey to identify and interact with the form.
  final _formKey = GlobalKey<FormState>();

  // Variables to store form input values.
  String _name = "";
  int _price = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    // Building the scaffold for the 'Add Item' form.
    return Scaffold(
      // Setting up the app bar with a title and styling.
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Item Form',
          ),
        ),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),

      // Including the LeftDrawer widget for navigation.
      drawer: const LeftDrawer(),

      // Building a Form widget to capture user input.
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextFormField for entering the item name.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Item Name",
                    labelText: "Item Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // TextFormField for entering the item price.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price must not be empty!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Price must be numbers!";
                    }
                    return null;
                  },
                ),
              ),

              // TextFormField for entering the item description.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "The description cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),

              // Aligning the 'Save' button at the bottom of the form.
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightGreen),
                    ),
                    onPressed: () {
                      // Validating the form and saving the item if valid.
                      if (_formKey.currentState!.validate()) {
                        items.add(Items(
                          name: _name,
                          price: _price,
                          description: _description,
                        ));

                        // Showing a dialog to confirm the saved item.
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Item saved successfully'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: $_name'),
                                    Text('Price: $_price'),
                                    Text('Description: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
