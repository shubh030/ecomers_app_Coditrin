import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;
  final int id;
  final void Function() onSelectProduct;

  ProductCard({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.onSelectProduct,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectProduct,
      child: Container(
        width: 170, // Set the desired width for the Card
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '\$$price',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imageUrl,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/codtronLogo.png', // Provide the path to your default image
                        fit: BoxFit.cover,
                        height: 10,
                        width: double.infinity,
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
