import 'package:ecomers_app/models/api_service.dart';
import 'package:ecomers_app/screens/product_Screen.dart';
import 'package:ecomers_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;
  final ApiService apiService = ApiService();
  List<Product> products = [];

  @override
  void initState() {
    textEditingController = TextEditingController();
    fetchProducts();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> fetchProducts() async {
    try {
      final fetchedProducts = await apiService.fetchProducts();
      setState(() {
        products = fetchedProducts;
      });
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  void _selectProduct(BuildContext context, Product selectedProduct) {
    final filteredProduct = products
        .where((product) => product.id == selectedProduct.id)
        .toList();

    if (filteredProduct.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => ProductScreen(
            title: filteredProduct[0].title,
            product: filteredProduct[0],
            
            
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        backgroundColor: Colors.pink.shade50
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  TextFormField(
                    controller: textEditingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(221, 19, 19, 19),
                      ),
                      suffixIcon: const Icon(
                        Icons.mic,
                        color: Color.fromARGB(221, 19, 19, 19),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Special Offer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'More items ->',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                      
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(119, 255, 255, 0),
                            border: Border.all(
                              color: Colors.yellow,
                              width: 2.0,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Text('5% Off'),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          // Handle the tap for the second button
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(148, 255, 64, 128),
                            border: Border.all(
                              color: Colors.pink,
                              width: 2.0,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Text('10% Off'),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          // Handle the tap for the third button
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(139, 178, 255, 89),
                            border: Border.all(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Text('15% Off'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20,),
            SizedBox(
              height: 350, // Set the desired height for the second horizontal scrolling grid
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    onSelectProduct: () {
                      _selectProduct(context, product);
                    },
                    id: product.id,
                    title: product.title,
                    price: product.price,
                    imageUrl: product.imageUrl,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
