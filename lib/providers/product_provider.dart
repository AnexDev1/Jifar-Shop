import 'package:flutter/material.dart';
import '../models/Product.dart';


class ProductProvider with ChangeNotifier {
  List<Product> _products = demoProducts;

  List<Product> get products => _products;

  void addProduct(Product product){
    _products.add(product);
    notifyListeners();
  }
}