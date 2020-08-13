import 'package:flutter/material.dart';

class CompleteOrder extends StatefulWidget {
  static const routeName = './orderpage'; 
  @override
  _CompleteOrderState createState() => _CompleteOrderState();
}

class _CompleteOrderState extends State<CompleteOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Text('Orderpage'), 
      ),
    );
  }
}