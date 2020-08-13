import 'package:BoldAlive/screens/atoms/head_of_app.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  static const routeName = './upload image';
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    List<String> mylist = ['https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg','https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg','https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg','https://cocooil.com.au/wp-content/uploads/2017/06/TanningOil_New-600x600.jpg'];
    return Scaffold(
          body: Container(
        child:Column(
          children: <Widget>[
            Headofapp(title: "Bold Alive",subtitle: 'Uplaod Your Custom Image',),
            Text('Uplaod Image'),
            SizedBox(height: 30,),
            CarouselSlider(
              options: CarouselOptions(
                    height: 350,
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
        )
      ),
    );
  }
}