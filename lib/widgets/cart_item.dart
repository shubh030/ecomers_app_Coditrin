import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final String itemName;
  final double itemPrice;
  int itemQuantity;
  bool isSelected; 

  CartItem({
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.isSelected, required Null Function() onSelectItem, 
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(2),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(widget.itemName),
                  subtitle: Text('Price: \$${widget.itemPrice.toStringAsFixed(2)}'),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: widget.isSelected,
                    onChanged: (value) {
                      setState(() {
                         widget.isSelected = value ?? false;
                      });
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 231, 231), // Gray background
                      borderRadius: BorderRadius.circular(15.0), // Border radius
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Add spacing
                    child: IconButton(
                      icon: Icon(Icons.remove),
                      color: Colors.black, // Change text color
                      onPressed: () {
                        setState(() {
                          if (widget.itemQuantity > 1) {
                            widget.itemQuantity--;
                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Add spacing
                    child: Text(
                      widget.itemQuantity.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Make text bold
                        fontSize: 18, // Increase font size
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(209, 0, 0, 0), // Black background
                      borderRadius: BorderRadius.circular(15.0), // Border radius
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Add spacing
                    child: IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.white, // Change text color
                      onPressed: () {
                        setState(() {
                          widget.itemQuantity++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
