import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'dart:io';

// Define the kPrimaryColor constant
const kPrimaryColor = Color(0xFFFF7643);

class CartCard extends StatelessWidget {
  final CartItem cart;

  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (cart.product.images.isNotEmpty)
          Container(
            height: 100, // Set a fixed height for the image container
            width: 100,  // Set a fixed width for the image container
            child: cart.product.images[0].startsWith('http')
                ? Image.network(cart.product.images[0], fit: BoxFit.cover)
                : Image.file(File(cart.product.images[0]), fit: BoxFit.cover),
          ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}