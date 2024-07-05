import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'dart:io';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onPress;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.images.isNotEmpty)
              AspectRatio(
                aspectRatio: 1, // Maintain a square aspect ratio
                child: product.images[0].startsWith('http')
                    ? Image.network(product.images[0], fit: BoxFit.cover)
                    : Image.file(File(product.images[0]), fit: BoxFit.cover),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('\$${product.price.toString()}'),
            ),
          ],
        ),
      ),
    );
  }
}