import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermarket/Items.dart';
import 'package:supermarket/models/cart.dart';
import 'package:supermarket/payout.dart';

import 'available_items.dart';
import 'item_selected.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Item> itemsSelected = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: MultiProvider(  
          providers: [
            ChangeNotifierProvider<CartModel>(create: (context) => CartModel()),
            // ChangeNotifierProvider<Item>(create: (context) => Item())
          ],
          child: Consumer<CartModel> ( 
            builder: (context, cart, child) => Scaffold(
            // AppBar
              appBar: AppBar( 
                backgroundColor: Colors.grey[350],
                leadingWidth: 60,
                leading: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cart.removeAllItem();
                          // print("on clear");
                          // cart.myCart = [];
                        },
                        child: Text(
                          "Clear", 
                          style: TextStyle( 
                            fontSize: 17, 
                            color: Colors.lightBlue
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                title: Text(
                  "Supermarket", 
                  style: TextStyle( 
                    color: Colors.black, 
                    fontWeight: FontWeight.w600, 
                    fontSize: 17,
                  )
                ),
              ),
              body: Column(
                children: [
                  AvailableItems(),
                  Container(
                    child: Column(  
                      children: [
                        for (var myItem in cart.myCart) 
                          // Consumer<Item> ( 
                          //   builder: (context, cart, child) =>
                          // )
                          ItemSelected(item: myItem)
                      ],
                    )
                  ),
                  Spacer(),
                  Payout(totalPrice: 0,)
                ],
              )
            ),
          )
          
      )
      
    );
  }
}











class CustomAppBar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: preferredSize.height,
        color: Colors.red, 
        child: Center(
          child: Text("Custom App Bar!"),
        ),

      );
  }
}
