import 'package:flutter/material.dart';

class FillDetails extends StatefulWidget {
  static const routeName = './filldetails';
  @override
  _FillDetailsState createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(
        child: Text('Fill details'),
      )
    );
  }
}