import 'package:flutter/material.dart';

class SelectItem extends StatefulWidget {
  @override
  _SelectItemState createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context).settings.arguments as String;

    return Container(
      child: Center(
        child: CircularProgressIndicator(backgroundColor: Colors.greenAccent,),
      ),
    );
  }
}