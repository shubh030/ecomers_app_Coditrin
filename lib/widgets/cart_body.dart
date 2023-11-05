import 'package:ecomers_app/screens/product_screen.dart';
import 'package:ecomers_app/screens/order%20screen.dart';
import 'package:flutter/material.dart';
import 'package:ecomers_app/models/api_service.dart';
import 'package:ecomers_app/widgets/cart_item.dart';

class CartBody extends StatefulWidget {
  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  List<Product> cartItems = [];
  Set<Product> selectedItems = Set<Product>(); // Track selected items
  bool isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    
    // Show the loading spinner initially
    startLoading();
  }

  void startLoading() {
    // Set isLoading to true to display the loading spinner
    setState(() {
      isLoading = true;
    });

    // Wait for 3 seconds before fetching and populating the cartItems list
    Future.delayed(Duration(seconds: 3), () {
      fetchProductData();
    });
  }

  Future<void> fetchProductData() async {
    try {
      final products = await ApiService().fetchProducts();
      setState(() {
        cartItems = products;
        isLoading = false; // Set loading state to false when data is loaded
      });
    } catch (error) {
      // Handle errors if needed
      print('Error fetching data: $error');
    }
  }

  void _selectProduct(Product selectedProduct) {
    if (selectedProduct != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => ProductScreen(
            title: selectedProduct.title,
            product: selectedProduct,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(), // Display a loading spinner
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                final isSelected = selectedItems.contains(product);

                return CartItem(
                  itemName: product.title,
                  itemPrice: product.price,
                  itemQuantity: 1, // You can set the quantity as needed
                  isSelected: isSelected,
                  onSelectItem: () {
                    setState(() {
                      if (isSelected) {
                        selectedItems.remove(product);
                      } else {
                        selectedItems.add(product);
                        _selectProduct(product); // Pass selected product to the ProductScreen
                      }
                    });
                  },
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to OrderScreen and pass the selected items
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => OrderScreen(selectedItems.toList()),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green, // Set button color
          ),
          child: Text("Check Out"),
        ),
      ),
    );
  }
}
