import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Items.dart';
import 'available_items.dart';
import 'models/cart.dart';

class ItemSelected extends StatelessWidget {
  const ItemSelected({
    Key key, 
    @required this.item,
  }) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    // print("item: ${item.name} , count: ${item.count}");
    return Container( 
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 10, right: 18),
        child: ChangeNotifierProvider.value( 
          value: item, 
          child:  Row( 
            children: [ 

              ItemCard(item: item, press: null),
              Column(  
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name, 
                    style: TextStyle( 
                      color: Colors.black,
                      fontWeight: FontWeight.w600, 
                    ),
                  ),
                  SizedBox(height: 3), 
                  Text(item.price.toString()+"/ kg")
                ],
              ),
              Spacer(),
              ItemCountSelected(item: item)
            ]
        )
        )
,
      )
    );
  }
}



class ItemCountSelected extends StatelessWidget {
  const ItemCountSelected({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context, listen: false);
    final itemCount = Provider.of<Item>(context, listen: false);
    return Row(  
      children: [
        NumOfItemButton(change: "-", borderColor: Colors.green, backgroundColor: Colors.white, textColor: Colors.green,
          press: () {
            if (itemCount.count == 1) {
              print("item = 1");
              // item.count = counter.count;
              cart.remove(item);
              // cart.remove
              print(cart.myCart.length);
            }
            else {
              itemCount.decrement();
              // item.count = counter.count;
            }
            cart.getTotalPrice();
            
            print("${item.name}, count: ${item.count}");
          },
        ),
        SizedBox(width: 10),
        Consumer<Item>( 
          builder: (context,myitem,child) => Text(myitem.count.toString(), style: TextStyle(color: Color(0xFF9A9A9A), fontSize: 10),),
        ),
        SizedBox(width: 10),
        NumOfItemButton(change: "+", borderColor: Colors.green, backgroundColor: Colors.green, textColor: Colors.white,
          press: () {            
            itemCount.increment();  
            // item.count = counter.count;
            cart.getTotalPrice();
            print("${item.name}, count: ${item.count}");
          },        
        )
      ],
    );
  }
}

class NumOfItemButton extends StatelessWidget {
  const NumOfItemButton({
    Key key, 
    @required this.change, 
    @required this.borderColor, 
    @required this.backgroundColor, 
    @required this.textColor, 
    this.press,

  }) : super(key: key);
  final String change; 
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 20, height: 20, 
        decoration: BoxDecoration( 
          color: backgroundColor,
          borderRadius: BorderRadius.circular(3), 
          border: Border.all(
            color: borderColor,
            width: 1,
          )
        ),
        child: Center(
          child: Text(
            change, 
            style: TextStyle(  
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textColor
            )
          )
        ),
      ),
    );
  }
}