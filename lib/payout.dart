import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

class Payout extends StatelessWidget {
  const Payout({
    Key key, 
    this.totalPrice,
  }) : super(key: key);
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartModel>(context, listen: false);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 133, 
        width: double.infinity,
        color: Color(0xFFF0F0F0),
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 18
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Text(
                    "Total",
                    style: TextStyle(
                      color: Color(0xFF9A9A9A)
                    ) 
                  ), 
                  Consumer<CartModel> (
                    builder: (context, cart, child) =>  Text(
                      "${cart.totalPrice} VND", 
                      style: TextStyle(
                        color: Colors.green, 
                        fontSize: 25, 
                        fontWeight: FontWeight.w700
                      )
                    )
                  )

                ]
              ),
              Container(
                height: 55,
                width: 127,
                decoration: BoxDecoration( 
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(9)
                ),
                child: Center(
                  child: Text(
                    'PAYOUT',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}