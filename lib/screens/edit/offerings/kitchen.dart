import 'package:flutter/material.dart';

class Kitchen extends StatelessWidget {
  static const routeName= './kitchen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child:Center(
          child: Text('this i sthe kitchen file'),
        )
      ),
    );
  }
}