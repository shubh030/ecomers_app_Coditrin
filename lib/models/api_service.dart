import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String apiUrl = 'https://b8fe2d5bb0.nxcli.io/rest/V1/products?searchCriteria[pageSize]=20';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer f9ueeprwel0p7na1rrnrr7g61q7feyzx',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> items = data['items'];

      return items.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

class Product {
  final int id; // Add an 'id' property
  final String title;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'], // Parse the 'id' field from the JSON data
      title: json['name'],
      price: (json['price'] ?? 0).toDouble(),
      imageUrl: json['image_url'] ?? '',
    );
  }

  get isSelected => null;
}

