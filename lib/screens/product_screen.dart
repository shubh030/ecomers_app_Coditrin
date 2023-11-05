import 'package:ecomers_app/models/api_service.dart';
import 'package:ecomers_app/screens/cart_screen.dart';
import 'package:ecomers_app/widgets/cart_item.dart';
import 'package:ecomers_app/widgets/cart_body.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String title;
  final Product product;

  ProductScreen({Key? key, required this.title, required this.product})
      : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Increased the spacing
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.product.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '\$${widget.product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
              const SizedBox(height: 20), 
              ElevatedButton(
                onPressed: () {

    //          CartItem itemToAdd = CartItem(
    //   itemName: widget.product.title,
    //   itemPrice: widget.product.price,
    //   itemQuantity: 1,
    //   isSelected: false,
    // );

   

        
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen()
            ),
          );

                  
                
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => CartScreen(title: widget.product.title, price: widget.product.price.toDouble()),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
