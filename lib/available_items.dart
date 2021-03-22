import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermarket/item_selected.dart';
import 'package:supermarket/models/cart.dart';

import 'models/Items.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key, 
    @required this.item, 
    this.press,
    
  }) : super(key: key);
  final Item item;
  final GestureTapCallback press;
  
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context, listen: false);
    return GestureDetector(
      
      onTap: () {
        // print(counter.name);
        cart.add(item);
        cart.getTotalPrice();
        // print(cart.myCart.length);

      },
      child: Container(
        margin: EdgeInsets.only(right: 7),
        padding: EdgeInsets.all(2),
        width: 60,
        height: 60,
        decoration: BoxDecoration( 
          color: Color(0xFFDFDFDF), 
          borderRadius: BorderRadius.circular(9)
        ),
        child: Image.asset(item.image),
      ),
    );
  }
}

class AvailableItems extends StatelessWidget {
  const AvailableItems({
    Key key, 
  }) : super(key: key);
  // _MyAppState parent;
  // final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF0F0F0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 7,
            vertical: 9
          ),
          child: Row( 
            children: [
              for (var item in demoItems)
                ItemCard(item: item)
            ]
          ),
        ),
      ),
    );
  }
}