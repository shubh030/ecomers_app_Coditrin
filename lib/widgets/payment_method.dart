import 'package:ecomers_app/widgets/shoing_address.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int selectedPaymentMethod = 0; // Initialize with the default selection
  void _openAddExpenceOverlay() {
  showModalBottomSheet(
    isScrollControlled: true, // Set this to true
    context: context,
    builder: (ctx) => Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      height: 500, // Set your desired height here
      child: ShoppingAddress(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Methods"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  "Card with Card Logo",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.credit_card),
                trailing: Radio(
                  value: 0,
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value as int;
                    });
                  },
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  "Visa***2341",
                  style: TextStyle(fontSize: 18),
                ),
                leading: Icon(Icons.credit_card),
                trailing: Radio(
                  value: 1,
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value as int;
                    });
                  },
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  "Debit ***123",
                  style: TextStyle(fontSize: 18),
                ),
                leading: Icon(Icons.credit_card),
                trailing: Radio(
                  value: 2,
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value as int;
                    });
                  },
                ),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                title: Text(
                  "Add New Card",
                  style: TextStyle(fontSize: 18),
                ),
                leading: Icon(Icons.add_circle),
                trailing: Radio(
                  value: 3,
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value as int;
                    });
                  },
                ),
              ),
            ),
            if (selectedPaymentMethod == 3)
              Padding(
                padding: EdgeInsets.only(top: 6),
                child: ElevatedButton(
                  onPressed: () {
                 
                  },
                  child: Text("Add"),
                ),
              ),
            Divider( // Add a horizontal line
              color: Colors.black,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container( // Add a black button at the bottom
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // Handle the logic for the selected payment method
           _openAddExpenceOverlay();
          },
          style: ElevatedButton.styleFrom(
          
            primary: Colors.black,
          ),
          child: Text("Use Selected Method", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}


