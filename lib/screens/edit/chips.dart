import 'package:flutter/material.dart';

class Chips extends StatefulWidget {
  //
  static const routeName ='./chips';

  @override
  State<StatefulWidget> createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  //
  String _selectedSize = '';
  final GlobalKey<FormState> _fbKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customise your order screen'),
      ),
      body: Column(
        children: <Widget>[
          Text('yes'),
          Text('no')
        ],
      )
    );
  }
}