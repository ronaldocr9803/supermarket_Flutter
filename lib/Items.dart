import 'package:flutter/material.dart';

class Item extends ChangeNotifier { 
  final String name, image; 
  final double price;
  int count;

  Item({
    @required this.name, 
    @required this.image, 
    @required this.price, 
    this.count = 1,
  }); 

  void increment() {
    ++this.count;
    notifyListeners();
  }

  void decrement() {
    --this.count;
    notifyListeners();
  }
}

List<Item> demoItems = [
  Item(name: "Apple", image: "assets/images/apple-1 1.png", price: 35000), 
  Item(name: "aubergine", image: "assets/images/aubergine 1.png", price: 17000), 
  Item(name: "banana", image: "assets/images/banana 1.png", price: 15000), 
  Item(name: "biscuit", image: "assets/images/biscuit 1.png", price: 21000), 
  Item(name: "blueberries", image: "assets/images/blueberries 1.png", price: 35300), 
  Item(name: "bread", image: "assets/images/bread 1.png", price: 35000), 
  Item(name: "broccoli", image: "assets/images/broccoli 1.png", price: 15000), 
  Item(name: "cabbage", image: "assets/images/cabbage 1.png", price: 10000)
];