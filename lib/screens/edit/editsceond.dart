import 'package:BoldAlive/screens/atoms/head_of_app.dart';
import 'package:BoldAlive/screens/edit/customise.dart';
import 'package:flutter/material.dart';

class EditSceond extends StatefulWidget {
  static const routeName = './editsceond';
  @override
  _EditSceondState createState() => _EditSceondState();
}

class _EditSceondState extends State<EditSceond> {
  
  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context).settings.arguments as Map<String,String>;
    return Scaffold(
      body: Column(
        children:<Widget>[
          Headofapp(title: 'Bold Alive',subtitle: 'Various Mugs And Cups',),
          Customise(title)          
          
        ], 
      ),
    );
  }
}