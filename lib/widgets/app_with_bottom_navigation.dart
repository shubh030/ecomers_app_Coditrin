import 'package:ecomers_app/screens/favrate_product.dart';
import 'package:ecomers_app/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecomers_app/screens/home_screen.dart';

import 'package:ecomers_app/screens/cart_screen.dart';


class AppWithBottomNavigation extends StatefulWidget {
  const AppWithBottomNavigation({Key? key}) : super(key: key);
  

  @override
  _AppWithBottomNavigationState createState() => _AppWithBottomNavigationState();
}

class _AppWithBottomNavigationState extends State<AppWithBottomNavigation> {
  int _selectedIndex = 0; // Initially, the first screen is selected

  final List<Widget> _screens = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink, // Set the background color to pink
        selectedItemColor: Colors.pink, // Set selected icons color to pink
        unselectedItemColor: Colors.black, // Set unselected icons color to black
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
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
