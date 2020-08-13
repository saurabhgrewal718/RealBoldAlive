import 'package:BoldAlive/screens/atoms/head_of_app.dart';
import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  static const routeName = './upload image';
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child:Column(
          children: <Widget>[
            Headofapp(title: "Bold Alive",subtitle: 'Uplaod Your Custom Image',),
            Text('Uplaod Image'),
          ],
        )
      ),
    );
  }
}