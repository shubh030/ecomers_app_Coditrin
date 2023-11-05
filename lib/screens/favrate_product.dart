import 'package:flutter/material.dart';
import 'package:ecomers_app/models/api_service.dart'; // Import your ApiService class

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 175, 204),
        title: Text('Favorite Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: ApiService().fetchProducts(), // Fetch products from your API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: const Text('No products found.'));
          } else {
            return Container(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 241, 220, 227)),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                ),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data?[index];
                  return _buildProductCard(product!);
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      child: Stack(
        children: [
          SizedBox(height: 20,),
          Column(
            children: [
              Image.network(product.imageUrl),
              Text(product.title),
              Text('Price: \$${product.price.toStringAsFixed(2)}'),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              icon: Icon(Icons.favorite), // You can customize this icon
              onPressed: () {
                // Implement your favorite functionality here
              },
            ),
          ),
        ],
      ),
    );
  }
}
