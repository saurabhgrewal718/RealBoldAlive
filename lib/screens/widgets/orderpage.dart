import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  static const routeName = './orders';
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child:Center(
          child: Text('this is order page'),
        )
      ),
    );
  }
}