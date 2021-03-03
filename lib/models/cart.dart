import 'package:flutter/foundation.dart';

import '../Items.dart';

class CartModel extends ChangeNotifier {
  List<Item> myCart = [];
  double totalPrice = 0;
  
    /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    if (myCart.contains(item)) {
      // item.count = item.count + 1;
      ++item.count;
      print("${item.name} exists");
    }
    else {
      myCart.add(item);
    }
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(Item item) {
    
    // myCart.remove(item);
    myCart.removeWhere((a) => a == item);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }

  void removeAllItem() {
    myCart = [];
    getTotalPrice();
    notifyListeners();
  }

  void getTotalPrice() {
    // double sum  = 0;
    totalPrice = 0;
    for (var item in myCart) {
      totalPrice = totalPrice + item.price*item.count;
    }
    print(totalPrice);
    notifyListeners();
    // return sum;
  }
}