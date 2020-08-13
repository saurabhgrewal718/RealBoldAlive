import 'package:BoldAlive/screens/atoms/head_of_app.dart';
import 'package:BoldAlive/screens/checkout/completeoder.dart';
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
            height: MediaQuery.of(context).size.height +50,
        child:Column(
          children: <Widget>[
            Headofapp(title: "Bold Alive",subtitle: 'Uplaod Your Custom Image',),
            
            SizedBox(height: 10,),
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
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'data SizedBox(height: 10,), SizedBox(height: 10,),SizedBox(height: 10,),SizedBox(height: 10,),',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'data SizedBox(height: 10,), SizedBox(height: 10,),SizedBox(height: 10,),SizedBox(height: 10,),',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    padding: EdgeInsets.only(top: 3, left: 3),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: (){},
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text('Upload Yours', style: TextStyle(
                        fontWeight: FontWeight.w600, 
                        fontSize: 18,
                        color: Colors.black
                      ),),
                    ),
                  ),
                  Container(
                width: MediaQuery.of(context).size.width*0.4,
                padding: EdgeInsets.only(top: 3, left: 3),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  )
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: (){
                    Navigator.of(context).pushNamed(CompleteOrder.routeName);
                  },
                  color: Colors.greenAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text('Buy Now', style: TextStyle(
                    fontWeight: FontWeight.w600, 
                    fontSize: 18,
                    color: Colors.black
                  ),),
                ),
              ),
              ],
            ),
              
              SizedBox(height: 10,),

          ],
        )
      ),
    );
  }
}