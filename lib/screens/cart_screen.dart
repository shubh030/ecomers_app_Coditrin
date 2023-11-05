import 'package:ecomers_app/widgets/cart_body.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black), // Change text color to black
        ),
        backgroundColor: Colors.pink.shade50,
        elevation: 0,
        actions: [
          Container(
            width: 100,
            margin:const EdgeInsets.all(8) , // Set the desired width
            child: TextButton(
              onPressed: () {
                // Define the action for the "Remove" button here
              },
              style: TextButton.styleFrom(
                primary: const Color.fromARGB(255, 255, 255, 255),
                backgroundColor: Colors.redAccent // Text color
              ),
              child: Text('Remove'),
            ),
          ),
        ],
      ),
      body: CartBody(),
    );
  }
}
