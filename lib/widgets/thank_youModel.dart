import 'package:ecomers_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ThankYouModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thank You"),
        backgroundColor:Colors.purple,
      ),
      body: Container(
        color: Color.fromARGB(255, 161, 55, 182), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Order Placed",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "Thank you! Your order has been placed",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 48,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Red button color
                minimumSize: Size(double.infinity, 50), // Width is double.infinity
              ),
              child: Text(
                "Continue Shoping",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
