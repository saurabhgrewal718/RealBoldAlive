import 'package:BoldAlive/Animation/FadeAnimation.dart';
import 'package:BoldAlive/screens/atoms/head_of_app.dart';
import 'package:BoldAlive/screens/details/components/placeorderform.dart';
import 'package:flutter/material.dart';

class Placeorder extends StatefulWidget {
  static const routeName = './place order';

  @override
  _PlaceorderState createState() => _PlaceorderState();
}

class _PlaceorderState extends State<Placeorder> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height+110,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Headofapp(title: 'Bold Alive',subtitle: 'Fill In Details',),
                PlaceorderForm(),             
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
    );
  }
}
