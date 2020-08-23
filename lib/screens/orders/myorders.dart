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
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back),color:Colors.black45, onPressed: (){
          Navigator.of(context).pop();
        }),
        title: Text('My Orders', style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),),
      ),
      body: Text('this is the ms '),
    );
  }
}