import 'package:BoldAlive/models/catagories.dart';
import 'package:flutter/material.dart';
import '../../../models/Product.dart';

import '../../../constants.dart';

class DrawerCatagory extends StatelessWidget {
  final Catagories catagories;
  final Function press;
  const DrawerCatagory({
    Key key,
    this.catagories,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${catagories.title}",
                child: Image.asset(catagories.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              catagories.title,
              textAlign: TextAlign.center,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          
        ],
      ),
    );
  }
}
