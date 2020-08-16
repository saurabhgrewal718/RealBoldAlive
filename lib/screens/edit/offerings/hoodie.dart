import 'package:BoldAlive/screens/atoms/head_of_app.dart';
import 'package:flutter/material.dart';
import '../tile2.dart';
import '../helpers/data_offerings.dart';


class Hoodie extends StatelessWidget {
  static const routeName= './hoodie';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Headofapp(title: 'Bold Alive',subtitle: 'Select any',),
              ),
              Container(
                    height: MediaQuery.of(context).size.height * 0.83,
                    child:
                    GridView.count(
                        childAspectRatio: 2,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        crossAxisCount: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: hoodieData.map((data) {
                        return Tile2(
                          title:data.title,
                          img:data.img,
                          subtitle:data.subtitle,
                          id: data.id,   
                          price: data.price,
                        );
                        }).toList()),
                   
              ),
            ],
          ),
    );
  }
}
