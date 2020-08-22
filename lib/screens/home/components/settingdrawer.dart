import 'package:BoldAlive/models/ProductProvider.dart';
import 'package:BoldAlive/models/catagories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class SettingsDrawer extends StatelessWidget {
  final Catagories catagories;
  final Function press;
  const SettingsDrawer({
    Key key,
    this.catagories,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profiles = Provider.of<ProductModel>(context,listen: false);
    return GestureDetector(
      onTap: (){
        profiles.fetchCatagories("${catagories.title}").then((value) => Navigator.of(context).pop());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
             
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
