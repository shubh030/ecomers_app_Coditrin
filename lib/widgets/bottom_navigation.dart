import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: const Color.fromARGB(255, 24, 23, 23), // Set the unselected item (icon) color to black
      selectedItemColor: Colors.pinkAccent, // Set the selected item (icon) color to pink accent
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.shop),
          label: 'Retail',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'User',
        ),
      ],
    );
  }
}
