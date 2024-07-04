import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';


class CartProvider with ChangeNotifier {
  final Cart _cart = Cart();

  Cart get cart => _cart;

  void addItem(Product product) {
    _cart.addItem(product);
    notifyListeners();
  }

  void removeItem(Product product){
    _cart.removeItem(product);
    notifyListeners();
  }

  void incrementItem(Product product){
    _cart.incrementItem(product);
    notifyListeners();
  }

  void decrementItem(Product product){
    _cart.decrementItem(product);
    notifyListeners();
  }



}