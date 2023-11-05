import 'package:ecomers_app/widgets/thank_youModel.dart';
import 'package:flutter/material.dart';

class ShoppingAddress extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 232, 235), // Blue accent color
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ListTile(
            title: Text(
              "Address",
              style: TextStyle(
                color: const Color.fromARGB(255, 15, 15, 15),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Icon(
              Icons.location_on,
              color: const Color.fromARGB(255, 7, 7, 7),
            ),
          ),
        ),
        Divider(color: Colors.white), // White divider
        LocationOption(text: "Home", subText: "123 Main St."),
        LocationOption(text: "Home Local", subText: "456 Another St."),
        LocationOption(text: "Home B", subText: "789 Different St."),
        Divider(color: Colors.white), // White divider
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ThankYouModel()));
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black, // Black button color
          ),
          child: Text("Use Selected Location", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

class LocationOption extends StatelessWidget {
  final String text;
  final String subText;

  LocationOption({required this.text, required this.subText});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Black text color
        ),
      ),
      subtitle: Text(
        subText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Black text color
        ),
      ),
      leading: Icon(
        Icons.location_on,
        color: const Color.fromARGB(255, 20, 20, 20), // Blue accent color
      ),
    );
  }
}
