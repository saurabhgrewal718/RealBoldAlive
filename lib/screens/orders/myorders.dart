import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyOrders extends StatefulWidget {
  static const routeName = './myorders';
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color(0xFFAEAEAE),
      elevation: 0,
      leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          // IconButton(
          //   icon: SvgPicture.asset("assets/icons/search.svg"),
          //   onPressed: () {},
          // ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              // By default our  icon color is white
              color: Colors.black,
            ),
            onPressed: () {
              
            },
          ),
          SizedBox(width: 20 / 2)
        ],
      ),
      body: Text('this is the ms '),
    );
  }
}