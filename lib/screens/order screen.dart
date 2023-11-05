import 'package:ecomers_app/widgets/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:ecomers_app/models/api_service.dart';

class OrderScreen extends StatefulWidget {
  final List<Product> selectedItems;
  final String randomAddress = "1234 Elm Street, City, Country"; // Random address

  OrderScreen(this.selectedItems);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Product> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final fetchedProducts = await ApiService().fetchProducts();
      setState(() {
        products = fetchedProducts;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching products: $e');
      isLoading = false;
    }
  }
  double calculateTotalPrice() {
  double total = 0;
  for (Product product in widget.selectedItems) {
    total += product.price;
  }
  return total  + 500.0; 
}
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
      child: PaymentMethod(),
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Confirmation" , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        backgroundColor: Color.fromARGB(255, 240, 212, 212),
      ),
      body: SingleChildScrollView(
        
        child: Container(
            color: Color.fromARGB(255, 250, 222, 222),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
               
                   const  Icon(Icons.location_on, color: Colors.blue),
                    const SizedBox(width: 8.0),
                    const Text(
                      "Delivery Address",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                 const    Spacer(),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Handle edit address action
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.randomAddress,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.credit_card, color: Colors.green),
                    SizedBox(width: 8.0),
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Credit Card", // Replace with the actual payment method
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        bool isSelected =true;
                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.all(16),
                          child: ListTile(
                            title: Text(
                              product.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Price: \$${product.price.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold, // Make price text bold
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: isSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      if (value == true) {
                                        widget.selectedItems.add(product);
                                      } else {
                                        widget.selectedItems.remove(product);
                                      }
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (widget.selectedItems.contains(product)) {
                                        widget.selectedItems.remove(product);
                                      }
                                    });
                                  },
                                ),
                            Text(
          (widget.selectedItems.where((item) => item == product).length + 1).toString(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      widget.selectedItems.add(product);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... Other code ...
        
            // Add a container for the summary
         Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 211, 209, 209),// Set the background color to pink
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
          "Summary",
          style: TextStyle(
            fontSize: 24, // Increase the font size for the title
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 51, 51, 51), // Set the title text color to white
          ),
              ),
              SizedBox(height: 16), // Increase the space between the title and other text
              Text(
          "Total: \$${calculateTotalPrice().toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: 18, // Adjust the font size for other text
            color: const Color.fromARGB(255, 8, 8, 8), // Set the text color to white
          ),
              ),
              Text(
          "Shipping: Free",
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 233, 19, 90),
          ),
              ),
              Text(
          "Discount: -\$3.00",
          style: TextStyle(
            fontSize: 18,
            color: Colors.pink,
          ),
              ),
              Text(
          "Tax: \$9.00",
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 24, 24, 24),
          ),
              ),
              Text(
          "Code: XYZ123",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 8, 8, 8),
          ),
              ),
              
            ],
          ),
        ),
        
        
          ],
        ),
         Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
          padding: EdgeInsets.all(16),
          color: Color.fromARGB(255, 211, 209, 209), // Background color
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: \$${calculateTotalPrice().toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 8, 8, 8),
                ),
              ),
           ElevatedButton(
          onPressed: () {
            _openAddExpenceOverlay();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green, // Set the background color to green
            onPrimary: Colors.white, // Set the text color to white
          ),
          child: Text(
            "Place Order",
            style: TextStyle(
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),
        ),
        
            ],
          ),
              ),
            ),
        
        
            ],
            
            
            
          ),
        ),
        
      ),
      
    );
  }
}

