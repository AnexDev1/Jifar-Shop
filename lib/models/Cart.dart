import 'Product.dart';

class CartItem {
  final Product product;
   int numOfItem;

  CartItem({required this.product,  this.numOfItem=1});

  void increment(){
    numOfItem++;
  }

  void decrement(){
    if(numOfItem >1 ){
      numOfItem --;
    }
  }
}

class Cart {
  final List<CartItem> items = [];

  void addItem(Product product) {
    for(var item in items){
      if(item.product.id == product.id){
        item.numOfItem++;
        return;
      }
    }
    items.add(CartItem(product: product));
  }

  void removeItem(Product product) {
    items.removeWhere((item)=> item.product.id == product.id);
  }

  void incrementItem(Product product){
    for(var item in items){
      if(item.product.id == product.id){
        item.increment();
        return;
      }
    }
  }

  void decrementItem(Product product){
    for(var item in items){
      if(item.product.id == product.id){
        item.decrement();
        return;
      }
    }
  }

  double get totalPrice {
    double total = 0.0;
    for(var item in items){
      total += item.product.price * item.numOfItem;
    }
    return total;
  }
  int get totalItems => items.length;
}


