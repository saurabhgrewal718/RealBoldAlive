import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../models/Product.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    List<String> mylist = ['https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg','https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg','https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg','https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Column(
        children: <Widget>[
          Text(
            product.description,
            style: TextStyle(height: 1.5),
          ),
          CarouselSlider(
              options: CarouselOptions(
                    height: 300,
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                ),
              items: mylist.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white60
                      ),
                      child: Image.network(i)
                    );
                  },
                );
              }).toList(),
            )
        ],
      ),
    );
  }
}
