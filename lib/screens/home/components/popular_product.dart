import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the provider package
import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../details/details_screen.dart';
import '../../products/products_screen.dart';
import 'section_title.dart';
import '../../../providers/product_provider.dart'; // Import the ProductProvider

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SectionTitle(
                title: "Popular Products",
                press: () {
                  Navigator.pushNamed(context, ProductsScreen.routeName);
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    productProvider.products.length,
                        (index) {
                      if (productProvider.products[index].isPopular) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: ProductCard(
                            product: productProvider.products[index],
                            onPress: () => Navigator.pushNamed(
                              context,
                              DetailsScreen.routeName,
                              arguments: ProductDetailsArguments(
                                  product: productProvider.products[index]),
                            ),
                          ),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}